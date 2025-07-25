package com.afollestad.materialdialogs;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.text.Editable;
import android.text.Html;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.TextView;
import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.afollestad.materialdialogs.DefaultRvAdapter;
import com.afollestad.materialdialogs.internal.MDButton;
import com.afollestad.materialdialogs.internal.MDRootLayout;
import com.afollestad.materialdialogs.internal.MDTintHelper;
import com.afollestad.materialdialogs.internal.ThemeSingleton;
import com.afollestad.materialdialogs.util.DialogUtils;
import com.afollestad.materialdialogs.util.RippleHelper;
import com.afollestad.materialdialogs.util.TypefaceHelper;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.apache.commons.p006io.IOUtils;

/* loaded from: classes.dex */
public class MaterialDialog extends DialogBase implements View.OnClickListener, DefaultRvAdapter.InternalListCallback {
    protected final Builder builder;
    CheckBox checkBoxPrompt;
    protected TextView content;
    FrameLayout customViewFrame;
    private final Handler handler;
    protected ImageView icon;
    EditText input;
    TextView inputMinMax;
    ListType listType;
    MDButton negativeButton;
    MDButton neutralButton;
    MDButton positiveButton;
    ProgressBar progressBar;
    TextView progressLabel;
    TextView progressMinMax;
    RecyclerView recyclerView;
    List<Integer> selectedIndicesList;
    protected TextView title;
    View titleFrame;

    public interface InputCallback {
        void onInput(MaterialDialog materialDialog, CharSequence charSequence);
    }

    public interface ListCallback {
        void onSelection(MaterialDialog materialDialog, View view, int i, CharSequence charSequence);
    }

    public interface ListCallbackMultiChoice {
        boolean onSelection(MaterialDialog materialDialog, Integer[] numArr, CharSequence[] charSequenceArr);
    }

    public interface ListCallbackSingleChoice {
        boolean onSelection(MaterialDialog materialDialog, View view, int i, CharSequence charSequence);
    }

    public interface ListLongCallback {
        boolean onLongSelection(MaterialDialog materialDialog, View view, int i, CharSequence charSequence);
    }

    public interface SingleButtonCallback {
        void onClick(MaterialDialog materialDialog, DialogAction dialogAction);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    public /* bridge */ /* synthetic */ View findViewById(int i) {
        return super.findViewById(i);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    @Deprecated
    public /* bridge */ /* synthetic */ void setContentView(int i) throws IllegalAccessError {
        super.setContentView(i);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    @Deprecated
    public /* bridge */ /* synthetic */ void setContentView(View view) throws IllegalAccessError {
        super.setContentView(view);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    @Deprecated
    public /* bridge */ /* synthetic */ void setContentView(View view, ViewGroup.LayoutParams layoutParams) throws IllegalAccessError {
        super.setContentView(view, layoutParams);
    }

    protected MaterialDialog(Builder builder) {
        super(builder.context, DialogInit.getTheme(builder));
        this.handler = new Handler();
        this.builder = builder;
        this.view = (MDRootLayout) LayoutInflater.from(builder.context).inflate(DialogInit.getInflateLayout(builder), (ViewGroup) null);
        DialogInit.init(this);
    }

    public final Builder getBuilder() {
        return this.builder;
    }

    public final void setTypeface(TextView textView, Typeface typeface) {
        if (typeface == null) {
            return;
        }
        textView.setPaintFlags(textView.getPaintFlags() | 128);
        textView.setTypeface(typeface);
    }

    public Object getTag() {
        return this.builder.tag;
    }

    final void checkIfListInitScroll() {
        RecyclerView recyclerView = this.recyclerView;
        if (recyclerView == null) {
            return;
        }
        recyclerView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.afollestad.materialdialogs.MaterialDialog.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                final int iIntValue;
                if (Build.VERSION.SDK_INT < 16) {
                    MaterialDialog.this.recyclerView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    MaterialDialog.this.recyclerView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                if (MaterialDialog.this.listType == ListType.SINGLE || MaterialDialog.this.listType == ListType.MULTI) {
                    if (MaterialDialog.this.listType == ListType.SINGLE) {
                        if (MaterialDialog.this.builder.selectedIndex < 0) {
                            return;
                        } else {
                            iIntValue = MaterialDialog.this.builder.selectedIndex;
                        }
                    } else {
                        if (MaterialDialog.this.selectedIndicesList == null || MaterialDialog.this.selectedIndicesList.size() == 0) {
                            return;
                        }
                        Collections.sort(MaterialDialog.this.selectedIndicesList);
                        iIntValue = MaterialDialog.this.selectedIndicesList.get(0).intValue();
                    }
                    MaterialDialog.this.recyclerView.post(new Runnable() { // from class: com.afollestad.materialdialogs.MaterialDialog.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            MaterialDialog.this.recyclerView.requestFocus();
                            MaterialDialog.this.builder.layoutManager.scrollToPosition(iIntValue);
                        }
                    });
                }
            }
        });
    }

    final void invalidateList() {
        if (this.recyclerView == null) {
            return;
        }
        if ((this.builder.items == null || this.builder.items.size() == 0) && this.builder.adapter == null) {
            return;
        }
        if (this.builder.layoutManager == null) {
            this.builder.layoutManager = new LinearLayoutManager(getContext());
        }
        if (this.recyclerView.getLayoutManager() == null) {
            this.recyclerView.setLayoutManager(this.builder.layoutManager);
        }
        this.recyclerView.setAdapter(this.builder.adapter);
        if (this.listType != null) {
            ((DefaultRvAdapter) this.builder.adapter).setCallback(this);
        }
    }

    @Override // com.afollestad.materialdialogs.DefaultRvAdapter.InternalListCallback
    public boolean onItemSelected(MaterialDialog materialDialog, View view, int i, CharSequence charSequence, boolean z) {
        boolean zSendSingleChoiceCallback = false;
        if (!view.isEnabled()) {
            return false;
        }
        ListType listType = this.listType;
        if (listType == null || listType == ListType.REGULAR) {
            if (this.builder.autoDismiss) {
                dismiss();
            }
            if (!z && this.builder.listCallback != null) {
                this.builder.listCallback.onSelection(this, view, i, this.builder.items.get(i));
            }
            if (z && this.builder.listLongCallback != null) {
                return this.builder.listLongCallback.onLongSelection(this, view, i, this.builder.items.get(i));
            }
        } else if (this.listType == ListType.MULTI) {
            CheckBox checkBox = (CheckBox) view.findViewById(C0386R.id.md_control);
            if (!checkBox.isEnabled()) {
                return false;
            }
            if (!this.selectedIndicesList.contains(Integer.valueOf(i))) {
                this.selectedIndicesList.add(Integer.valueOf(i));
                if (!this.builder.alwaysCallMultiChoiceCallback || sendMultiChoiceCallback()) {
                    checkBox.setChecked(true);
                } else {
                    this.selectedIndicesList.remove(Integer.valueOf(i));
                }
            } else {
                this.selectedIndicesList.remove(Integer.valueOf(i));
                if (!this.builder.alwaysCallMultiChoiceCallback || sendMultiChoiceCallback()) {
                    checkBox.setChecked(false);
                } else {
                    this.selectedIndicesList.add(Integer.valueOf(i));
                }
            }
        } else if (this.listType == ListType.SINGLE) {
            RadioButton radioButton = (RadioButton) view.findViewById(C0386R.id.md_control);
            if (!radioButton.isEnabled()) {
                return false;
            }
            int i2 = this.builder.selectedIndex;
            if (this.builder.autoDismiss && this.builder.positiveText == null) {
                dismiss();
                this.builder.selectedIndex = i;
                sendSingleChoiceCallback(view);
            } else if (this.builder.alwaysCallSingleChoiceCallback) {
                this.builder.selectedIndex = i;
                zSendSingleChoiceCallback = sendSingleChoiceCallback(view);
                this.builder.selectedIndex = i2;
            } else {
                zSendSingleChoiceCallback = true;
            }
            if (zSendSingleChoiceCallback) {
                this.builder.selectedIndex = i;
                radioButton.setChecked(true);
                this.builder.adapter.notifyItemChanged(i2);
                this.builder.adapter.notifyItemChanged(i);
            }
        }
        return true;
    }

    final Drawable getListSelector() {
        if (this.builder.listSelector != 0) {
            return ResourcesCompat.getDrawable(this.builder.context.getResources(), this.builder.listSelector, null);
        }
        Drawable drawableResolveDrawable = DialogUtils.resolveDrawable(this.builder.context, C0386R.attr.md_list_selector);
        return drawableResolveDrawable != null ? drawableResolveDrawable : DialogUtils.resolveDrawable(getContext(), C0386R.attr.md_list_selector);
    }

    public RecyclerView getRecyclerView() {
        return this.recyclerView;
    }

    public boolean isPromptCheckBoxChecked() {
        CheckBox checkBox = this.checkBoxPrompt;
        return checkBox != null && checkBox.isChecked();
    }

    public void setPromptCheckBoxChecked(boolean z) {
        CheckBox checkBox = this.checkBoxPrompt;
        if (checkBox != null) {
            checkBox.setChecked(z);
        }
    }

    Drawable getButtonSelector(DialogAction dialogAction, boolean z) {
        if (z) {
            if (this.builder.btnSelectorStacked != 0) {
                return ResourcesCompat.getDrawable(this.builder.context.getResources(), this.builder.btnSelectorStacked, null);
            }
            Drawable drawableResolveDrawable = DialogUtils.resolveDrawable(this.builder.context, C0386R.attr.md_btn_stacked_selector);
            return drawableResolveDrawable != null ? drawableResolveDrawable : DialogUtils.resolveDrawable(getContext(), C0386R.attr.md_btn_stacked_selector);
        }
        int i = C03854.$SwitchMap$com$afollestad$materialdialogs$DialogAction[dialogAction.ordinal()];
        if (i == 1) {
            if (this.builder.btnSelectorNeutral != 0) {
                return ResourcesCompat.getDrawable(this.builder.context.getResources(), this.builder.btnSelectorNeutral, null);
            }
            Drawable drawableResolveDrawable2 = DialogUtils.resolveDrawable(this.builder.context, C0386R.attr.md_btn_neutral_selector);
            if (drawableResolveDrawable2 != null) {
                return drawableResolveDrawable2;
            }
            Drawable drawableResolveDrawable3 = DialogUtils.resolveDrawable(getContext(), C0386R.attr.md_btn_neutral_selector);
            if (Build.VERSION.SDK_INT >= 21) {
                RippleHelper.applyColor(drawableResolveDrawable3, this.builder.buttonRippleColor);
            }
            return drawableResolveDrawable3;
        }
        if (i != 2) {
            if (this.builder.btnSelectorPositive != 0) {
                return ResourcesCompat.getDrawable(this.builder.context.getResources(), this.builder.btnSelectorPositive, null);
            }
            Drawable drawableResolveDrawable4 = DialogUtils.resolveDrawable(this.builder.context, C0386R.attr.md_btn_positive_selector);
            if (drawableResolveDrawable4 != null) {
                return drawableResolveDrawable4;
            }
            Drawable drawableResolveDrawable5 = DialogUtils.resolveDrawable(getContext(), C0386R.attr.md_btn_positive_selector);
            if (Build.VERSION.SDK_INT >= 21) {
                RippleHelper.applyColor(drawableResolveDrawable5, this.builder.buttonRippleColor);
            }
            return drawableResolveDrawable5;
        }
        if (this.builder.btnSelectorNegative != 0) {
            return ResourcesCompat.getDrawable(this.builder.context.getResources(), this.builder.btnSelectorNegative, null);
        }
        Drawable drawableResolveDrawable6 = DialogUtils.resolveDrawable(this.builder.context, C0386R.attr.md_btn_negative_selector);
        if (drawableResolveDrawable6 != null) {
            return drawableResolveDrawable6;
        }
        Drawable drawableResolveDrawable7 = DialogUtils.resolveDrawable(getContext(), C0386R.attr.md_btn_negative_selector);
        if (Build.VERSION.SDK_INT >= 21) {
            RippleHelper.applyColor(drawableResolveDrawable7, this.builder.buttonRippleColor);
        }
        return drawableResolveDrawable7;
    }

    private boolean sendSingleChoiceCallback(View view) {
        if (this.builder.listCallbackSingleChoice == null) {
            return false;
        }
        CharSequence charSequence = null;
        if (this.builder.selectedIndex >= 0 && this.builder.selectedIndex < this.builder.items.size()) {
            charSequence = this.builder.items.get(this.builder.selectedIndex);
        }
        return this.builder.listCallbackSingleChoice.onSelection(this, view, this.builder.selectedIndex, charSequence);
    }

    private boolean sendMultiChoiceCallback() {
        if (this.builder.listCallbackMultiChoice == null) {
            return false;
        }
        Collections.sort(this.selectedIndicesList);
        ArrayList arrayList = new ArrayList();
        for (Integer num : this.selectedIndicesList) {
            if (num.intValue() >= 0 && num.intValue() <= this.builder.items.size() - 1) {
                arrayList.add(this.builder.items.get(num.intValue()));
            }
        }
        ListCallbackMultiChoice listCallbackMultiChoice = this.builder.listCallbackMultiChoice;
        List<Integer> list = this.selectedIndicesList;
        return listCallbackMultiChoice.onSelection(this, (Integer[]) list.toArray(new Integer[list.size()]), (CharSequence[]) arrayList.toArray(new CharSequence[arrayList.size()]));
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        DialogAction dialogAction = (DialogAction) view.getTag();
        int i = C03854.$SwitchMap$com$afollestad$materialdialogs$DialogAction[dialogAction.ordinal()];
        if (i == 1) {
            if (this.builder.callback != null) {
                this.builder.callback.onAny(this);
                this.builder.callback.onNeutral(this);
            }
            if (this.builder.onNeutralCallback != null) {
                this.builder.onNeutralCallback.onClick(this, dialogAction);
            }
            if (this.builder.autoDismiss) {
                dismiss();
            }
        } else if (i == 2) {
            if (this.builder.callback != null) {
                this.builder.callback.onAny(this);
                this.builder.callback.onNegative(this);
            }
            if (this.builder.onNegativeCallback != null) {
                this.builder.onNegativeCallback.onClick(this, dialogAction);
            }
            if (this.builder.autoDismiss) {
                cancel();
            }
        } else if (i == 3) {
            if (this.builder.callback != null) {
                this.builder.callback.onAny(this);
                this.builder.callback.onPositive(this);
            }
            if (this.builder.onPositiveCallback != null) {
                this.builder.onPositiveCallback.onClick(this, dialogAction);
            }
            if (!this.builder.alwaysCallSingleChoiceCallback) {
                sendSingleChoiceCallback(view);
            }
            if (!this.builder.alwaysCallMultiChoiceCallback) {
                sendMultiChoiceCallback();
            }
            if (this.builder.inputCallback != null && this.input != null && !this.builder.alwaysCallInputCallback) {
                this.builder.inputCallback.onInput(this, this.input.getText());
            }
            if (this.builder.autoDismiss) {
                dismiss();
            }
        }
        if (this.builder.onAnyCallback != null) {
            this.builder.onAnyCallback.onClick(this, dialogAction);
        }
    }

    @Override // android.app.Dialog
    public void show() {
        try {
            super.show();
        } catch (WindowManager.BadTokenException unused) {
            throw new DialogException("Bad window token, you cannot show a dialog before an Activity is created or after it's hidden.");
        }
    }

    public final MDButton getActionButton(DialogAction dialogAction) {
        int i = C03854.$SwitchMap$com$afollestad$materialdialogs$DialogAction[dialogAction.ordinal()];
        if (i == 1) {
            return this.neutralButton;
        }
        if (i != 2) {
            return this.positiveButton;
        }
        return this.negativeButton;
    }

    public final View getView() {
        return this.view;
    }

    public final EditText getInputEditText() {
        return this.input;
    }

    public final TextView getTitleView() {
        return this.title;
    }

    public ImageView getIconView() {
        return this.icon;
    }

    public final TextView getContentView() {
        return this.content;
    }

    public final View getCustomView() {
        return this.builder.customView;
    }

    public final void setActionButton(DialogAction dialogAction, CharSequence charSequence) {
        int i = C03854.$SwitchMap$com$afollestad$materialdialogs$DialogAction[dialogAction.ordinal()];
        if (i == 1) {
            this.builder.neutralText = charSequence;
            this.neutralButton.setText(charSequence);
            this.neutralButton.setVisibility(charSequence != null ? 0 : 8);
        } else if (i != 2) {
            this.builder.positiveText = charSequence;
            this.positiveButton.setText(charSequence);
            this.positiveButton.setVisibility(charSequence != null ? 0 : 8);
        } else {
            this.builder.negativeText = charSequence;
            this.negativeButton.setText(charSequence);
            this.negativeButton.setVisibility(charSequence != null ? 0 : 8);
        }
    }

    public final void setActionButton(DialogAction dialogAction, int i) {
        setActionButton(dialogAction, getContext().getText(i));
    }

    public final boolean hasActionButtons() {
        return numberOfActionButtons() > 0;
    }

    public final int numberOfActionButtons() {
        int i = this.positiveButton.getVisibility() == 0 ? 1 : 0;
        if (this.neutralButton.getVisibility() == 0) {
            i++;
        }
        return this.negativeButton.getVisibility() == 0 ? i + 1 : i;
    }

    @Override // android.app.Dialog
    public final void setTitle(CharSequence charSequence) {
        this.title.setText(charSequence);
    }

    @Override // android.app.Dialog
    public final void setTitle(int i) {
        setTitle(this.builder.context.getString(i));
    }

    public final void setTitle(int i, Object... objArr) {
        setTitle(this.builder.context.getString(i, objArr));
    }

    public void setIcon(int i) {
        this.icon.setImageResource(i);
        this.icon.setVisibility(i != 0 ? 0 : 8);
    }

    public void setIcon(Drawable drawable) {
        this.icon.setImageDrawable(drawable);
        this.icon.setVisibility(drawable != null ? 0 : 8);
    }

    public void setIconAttribute(int i) {
        setIcon(DialogUtils.resolveDrawable(this.builder.context, i));
    }

    public final void setContent(CharSequence charSequence) {
        this.content.setText(charSequence);
        this.content.setVisibility(TextUtils.isEmpty(charSequence) ? 8 : 0);
    }

    public final void setContent(int i) {
        setContent(this.builder.context.getString(i));
    }

    public final void setContent(int i, Object... objArr) {
        setContent(this.builder.context.getString(i, objArr));
    }

    public final ArrayList<CharSequence> getItems() {
        return this.builder.items;
    }

    public final void setItems(CharSequence... charSequenceArr) {
        if (this.builder.adapter == null) {
            throw new IllegalStateException("This MaterialDialog instance does not yet have an adapter set to it. You cannot use setItems().");
        }
        if (charSequenceArr != null) {
            this.builder.items = new ArrayList<>(charSequenceArr.length);
            Collections.addAll(this.builder.items, charSequenceArr);
        } else {
            this.builder.items = null;
        }
        if (!(this.builder.adapter instanceof DefaultRvAdapter)) {
            throw new IllegalStateException("When using a custom adapter, setItems() cannot be used. Set items through the adapter instead.");
        }
        notifyItemsChanged();
    }

    public final void notifyItemInserted(int i) {
        this.builder.adapter.notifyItemInserted(i);
    }

    public final void notifyItemChanged(int i) {
        this.builder.adapter.notifyItemChanged(i);
    }

    public final void notifyItemsChanged() {
        this.builder.adapter.notifyDataSetChanged();
    }

    public final int getCurrentProgress() {
        ProgressBar progressBar = this.progressBar;
        if (progressBar == null) {
            return -1;
        }
        return progressBar.getProgress();
    }

    public ProgressBar getProgressBar() {
        return this.progressBar;
    }

    public final void incrementProgress(int i) {
        setProgress(getCurrentProgress() + i);
    }

    public final void setProgress(int i) {
        if (this.builder.progress <= -2) {
            Log.w("MaterialDialog", "Calling setProgress(int) on an indeterminate progress dialog has no effect!");
        } else {
            this.progressBar.setProgress(i);
            this.handler.post(new Runnable() { // from class: com.afollestad.materialdialogs.MaterialDialog.2
                @Override // java.lang.Runnable
                public void run() {
                    if (MaterialDialog.this.progressLabel != null) {
                        MaterialDialog.this.progressLabel.setText(MaterialDialog.this.builder.progressPercentFormat.format(MaterialDialog.this.getCurrentProgress() / MaterialDialog.this.getMaxProgress()));
                    }
                    if (MaterialDialog.this.progressMinMax != null) {
                        MaterialDialog.this.progressMinMax.setText(String.format(MaterialDialog.this.builder.progressNumberFormat, Integer.valueOf(MaterialDialog.this.getCurrentProgress()), Integer.valueOf(MaterialDialog.this.getMaxProgress())));
                    }
                }
            });
        }
    }

    public final boolean isIndeterminateProgress() {
        return this.builder.indeterminateProgress;
    }

    public final int getMaxProgress() {
        ProgressBar progressBar = this.progressBar;
        if (progressBar == null) {
            return -1;
        }
        return progressBar.getMax();
    }

    public final void setMaxProgress(int i) {
        if (this.builder.progress <= -2) {
            throw new IllegalStateException("Cannot use setMaxProgress() on this dialog.");
        }
        this.progressBar.setMax(i);
    }

    public final void setProgressPercentFormat(NumberFormat numberFormat) {
        this.builder.progressPercentFormat = numberFormat;
        setProgress(getCurrentProgress());
    }

    public final void setProgressNumberFormat(String str) {
        this.builder.progressNumberFormat = str;
        setProgress(getCurrentProgress());
    }

    public final boolean isCancelled() {
        return !isShowing();
    }

    public int getSelectedIndex() {
        if (this.builder.listCallbackSingleChoice != null) {
            return this.builder.selectedIndex;
        }
        return -1;
    }

    public void setSelectedIndex(int i) {
        this.builder.selectedIndex = i;
        if (this.builder.adapter != null && (this.builder.adapter instanceof DefaultRvAdapter)) {
            this.builder.adapter.notifyDataSetChanged();
            return;
        }
        throw new IllegalStateException("You can only use setSelectedIndex() with the default adapter implementation.");
    }

    public Integer[] getSelectedIndices() {
        if (this.builder.listCallbackMultiChoice == null) {
            return null;
        }
        List<Integer> list = this.selectedIndicesList;
        return (Integer[]) list.toArray(new Integer[list.size()]);
    }

    public void setSelectedIndices(Integer[] numArr) {
        this.selectedIndicesList = new ArrayList(Arrays.asList(numArr));
        if (this.builder.adapter != null && (this.builder.adapter instanceof DefaultRvAdapter)) {
            this.builder.adapter.notifyDataSetChanged();
            return;
        }
        throw new IllegalStateException("You can only use setSelectedIndices() with the default adapter implementation.");
    }

    public void clearSelectedIndices() {
        clearSelectedIndices(true);
    }

    public void clearSelectedIndices(boolean z) {
        ListType listType = this.listType;
        if (listType == null || listType != ListType.MULTI) {
            throw new IllegalStateException("You can only use clearSelectedIndices() with multi choice list dialogs.");
        }
        if (this.builder.adapter != null && (this.builder.adapter instanceof DefaultRvAdapter)) {
            List<Integer> list = this.selectedIndicesList;
            if (list != null) {
                list.clear();
            }
            this.builder.adapter.notifyDataSetChanged();
            if (!z || this.builder.listCallbackMultiChoice == null) {
                return;
            }
            sendMultiChoiceCallback();
            return;
        }
        throw new IllegalStateException("You can only use clearSelectedIndices() with the default adapter implementation.");
    }

    public void selectAllIndices() {
        selectAllIndices(true);
    }

    public void selectAllIndices(boolean z) {
        ListType listType = this.listType;
        if (listType == null || listType != ListType.MULTI) {
            throw new IllegalStateException("You can only use selectAllIndices() with multi choice list dialogs.");
        }
        if (this.builder.adapter != null && (this.builder.adapter instanceof DefaultRvAdapter)) {
            if (this.selectedIndicesList == null) {
                this.selectedIndicesList = new ArrayList();
            }
            for (int i = 0; i < this.builder.adapter.getItemCount(); i++) {
                if (!this.selectedIndicesList.contains(Integer.valueOf(i))) {
                    this.selectedIndicesList.add(Integer.valueOf(i));
                }
            }
            this.builder.adapter.notifyDataSetChanged();
            if (!z || this.builder.listCallbackMultiChoice == null) {
                return;
            }
            sendMultiChoiceCallback();
            return;
        }
        throw new IllegalStateException("You can only use selectAllIndices() with the default adapter implementation.");
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.content.DialogInterface.OnShowListener
    public final void onShow(DialogInterface dialogInterface) {
        if (this.input != null) {
            DialogUtils.showKeyboard(this, this.builder);
            if (this.input.getText().length() > 0) {
                EditText editText = this.input;
                editText.setSelection(editText.getText().length());
            }
        }
        super.onShow(dialogInterface);
    }

    void setInternalInputCallback() {
        EditText editText = this.input;
        if (editText == null) {
            return;
        }
        editText.addTextChangedListener(new TextWatcher() { // from class: com.afollestad.materialdialogs.MaterialDialog.3
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                int length = charSequence.toString().length();
                if (!MaterialDialog.this.builder.inputAllowEmpty) {
                    z = length == 0;
                    MaterialDialog.this.getActionButton(DialogAction.POSITIVE).setEnabled(!z);
                }
                MaterialDialog.this.invalidateInputMinMaxIndicator(length, z);
                if (MaterialDialog.this.builder.alwaysCallInputCallback) {
                    MaterialDialog.this.builder.inputCallback.onInput(MaterialDialog.this, charSequence);
                }
            }
        });
    }

    void invalidateInputMinMaxIndicator(int i, boolean z) {
        if (this.inputMinMax != null) {
            if (this.builder.inputMaxLength > 0) {
                this.inputMinMax.setText(String.format(Locale.getDefault(), "%d/%d", Integer.valueOf(i), Integer.valueOf(this.builder.inputMaxLength)));
                this.inputMinMax.setVisibility(0);
            } else {
                this.inputMinMax.setVisibility(8);
            }
            boolean z2 = (z && i == 0) || (this.builder.inputMaxLength > 0 && i > this.builder.inputMaxLength) || i < this.builder.inputMinLength;
            Builder builder = this.builder;
            int i2 = z2 ? builder.inputRangeErrorColor : builder.contentColor;
            Builder builder2 = this.builder;
            int i3 = z2 ? builder2.inputRangeErrorColor : builder2.widgetColor;
            if (this.builder.inputMaxLength > 0) {
                this.inputMinMax.setTextColor(i2);
            }
            MDTintHelper.setTint(this.input, i3);
            getActionButton(DialogAction.POSITIVE).setEnabled(!z2);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        if (this.input != null) {
            DialogUtils.hideKeyboard(this, this.builder);
        }
        super.dismiss();
    }

    /* renamed from: com.afollestad.materialdialogs.MaterialDialog$4 */
    static /* synthetic */ class C03854 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$DialogAction;

        /* renamed from: $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType */
        static final /* synthetic */ int[] f68x59373eeb;

        static {
            int[] iArr = new int[ListType.values().length];
            f68x59373eeb = iArr;
            try {
                iArr[ListType.REGULAR.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f68x59373eeb[ListType.SINGLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f68x59373eeb[ListType.MULTI.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            int[] iArr2 = new int[DialogAction.values().length];
            $SwitchMap$com$afollestad$materialdialogs$DialogAction = iArr2;
            try {
                iArr2[DialogAction.NEUTRAL.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.NEGATIVE.ordinal()] = 2;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.POSITIVE.ordinal()] = 3;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    enum ListType {
        REGULAR,
        SINGLE,
        MULTI;

        public static int getLayoutForType(ListType listType) {
            int i = C03854.f68x59373eeb[listType.ordinal()];
            if (i == 1) {
                return C0386R.layout.md_listitem;
            }
            if (i == 2) {
                return C0386R.layout.md_listitem_singlechoice;
            }
            if (i == 3) {
                return C0386R.layout.md_listitem_multichoice;
            }
            throw new IllegalArgumentException("Not a valid list type");
        }
    }

    private static class DialogException extends WindowManager.BadTokenException {
        DialogException(String str) {
            super(str);
        }
    }

    public static class Builder {
        protected RecyclerView.Adapter<?> adapter;
        protected boolean alwaysCallInputCallback;
        protected int backgroundColor;
        protected int btnSelectorNegative;
        protected int btnSelectorNeutral;
        protected int btnSelectorPositive;
        protected int btnSelectorStacked;
        protected GravityEnum btnStackedGravity;
        protected int buttonRippleColor;
        protected GravityEnum buttonsGravity;
        protected ButtonCallback callback;
        protected DialogInterface.OnCancelListener cancelListener;
        protected CharSequence checkBoxPrompt;
        protected boolean checkBoxPromptInitiallyChecked;
        protected CompoundButton.OnCheckedChangeListener checkBoxPromptListener;
        protected ColorStateList choiceWidgetColor;
        protected CharSequence content;
        protected GravityEnum contentGravity;
        protected final Context context;
        protected View customView;
        protected DialogInterface.OnDismissListener dismissListener;
        protected int dividerColor;
        protected Drawable icon;
        protected boolean indeterminateIsHorizontalProgress;
        protected boolean indeterminateProgress;
        protected boolean inputAllowEmpty;
        protected InputCallback inputCallback;
        protected CharSequence inputHint;
        protected CharSequence inputPrefill;
        protected int itemColor;
        protected int[] itemIds;
        protected ArrayList<CharSequence> items;
        protected GravityEnum itemsGravity;
        protected DialogInterface.OnKeyListener keyListener;
        protected RecyclerView.LayoutManager layoutManager;
        protected boolean limitIconToDefaultSize;
        protected ColorStateList linkColor;
        protected ListCallback listCallback;
        protected ListCallbackMultiChoice listCallbackMultiChoice;
        protected ListCallbackSingleChoice listCallbackSingleChoice;
        protected ListLongCallback listLongCallback;
        protected int listSelector;
        protected Typeface mediumFont;
        protected ColorStateList negativeColor;
        protected boolean negativeFocus;
        protected CharSequence negativeText;
        protected ColorStateList neutralColor;
        protected boolean neutralFocus;
        protected CharSequence neutralText;
        protected SingleButtonCallback onAnyCallback;
        protected SingleButtonCallback onNegativeCallback;
        protected SingleButtonCallback onNeutralCallback;
        protected SingleButtonCallback onPositiveCallback;
        protected ColorStateList positiveColor;
        protected boolean positiveFocus;
        protected CharSequence positiveText;
        protected String progressNumberFormat;
        protected NumberFormat progressPercentFormat;
        protected Typeface regularFont;
        protected DialogInterface.OnShowListener showListener;
        protected boolean showMinMax;
        protected StackingBehavior stackingBehavior;
        protected Object tag;
        protected Theme theme;
        protected CharSequence title;
        protected GravityEnum titleGravity;
        protected int widgetColor;
        protected boolean wrapCustomViewInScroll;
        protected int titleColor = -1;
        protected int contentColor = -1;
        protected boolean alwaysCallMultiChoiceCallback = false;
        protected boolean alwaysCallSingleChoiceCallback = false;
        protected boolean cancelable = true;
        protected boolean canceledOnTouchOutside = true;
        protected float contentLineSpacingMultiplier = 1.2f;
        protected int selectedIndex = -1;
        protected Integer[] selectedIndices = null;
        protected Integer[] disabledIndices = null;
        protected boolean autoDismiss = true;
        protected int maxIconSize = -1;
        protected int progress = -2;
        protected int progressMax = 0;
        protected int inputType = -1;
        protected int inputMinLength = -1;
        protected int inputMaxLength = -1;
        protected int inputRangeErrorColor = 0;
        protected boolean titleColorSet = false;
        protected boolean contentColorSet = false;
        protected boolean itemColorSet = false;
        protected boolean positiveColorSet = false;
        protected boolean neutralColorSet = false;
        protected boolean negativeColorSet = false;
        protected boolean widgetColorSet = false;
        protected boolean dividerColorSet = false;

        public Builder(Context context) {
            this.titleGravity = GravityEnum.START;
            this.contentGravity = GravityEnum.START;
            this.btnStackedGravity = GravityEnum.END;
            this.itemsGravity = GravityEnum.START;
            this.buttonsGravity = GravityEnum.START;
            this.buttonRippleColor = 0;
            this.theme = Theme.LIGHT;
            this.context = context;
            this.widgetColor = DialogUtils.resolveColor(context, C0386R.attr.colorAccent, DialogUtils.getColor(context, C0386R.color.md_material_blue_600));
            if (Build.VERSION.SDK_INT >= 21) {
                this.widgetColor = DialogUtils.resolveColor(context, android.R.attr.colorAccent, this.widgetColor);
            }
            this.positiveColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.negativeColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.neutralColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.linkColor = DialogUtils.getActionTextStateList(context, DialogUtils.resolveColor(context, C0386R.attr.md_link_color, this.widgetColor));
            this.buttonRippleColor = DialogUtils.resolveColor(context, C0386R.attr.md_btn_ripple_color, DialogUtils.resolveColor(context, C0386R.attr.colorControlHighlight, Build.VERSION.SDK_INT >= 21 ? DialogUtils.resolveColor(context, android.R.attr.colorControlHighlight) : 0));
            this.progressPercentFormat = NumberFormat.getPercentInstance();
            this.progressNumberFormat = "%1d/%2d";
            this.theme = DialogUtils.isColorDark(DialogUtils.resolveColor(context, android.R.attr.textColorPrimary)) ? Theme.LIGHT : Theme.DARK;
            checkSingleton();
            this.titleGravity = DialogUtils.resolveGravityEnum(context, C0386R.attr.md_title_gravity, this.titleGravity);
            this.contentGravity = DialogUtils.resolveGravityEnum(context, C0386R.attr.md_content_gravity, this.contentGravity);
            this.btnStackedGravity = DialogUtils.resolveGravityEnum(context, C0386R.attr.md_btnstacked_gravity, this.btnStackedGravity);
            this.itemsGravity = DialogUtils.resolveGravityEnum(context, C0386R.attr.md_items_gravity, this.itemsGravity);
            this.buttonsGravity = DialogUtils.resolveGravityEnum(context, C0386R.attr.md_buttons_gravity, this.buttonsGravity);
            try {
                typeface(DialogUtils.resolveString(context, C0386R.attr.md_medium_font), DialogUtils.resolveString(context, C0386R.attr.md_regular_font));
            } catch (Throwable unused) {
            }
            if (this.mediumFont == null) {
                try {
                    if (Build.VERSION.SDK_INT >= 21) {
                        this.mediumFont = Typeface.create("sans-serif-medium", 0);
                    } else {
                        this.mediumFont = Typeface.create("sans-serif", 1);
                    }
                } catch (Throwable unused2) {
                    this.mediumFont = Typeface.DEFAULT_BOLD;
                }
            }
            if (this.regularFont == null) {
                try {
                    this.regularFont = Typeface.create("sans-serif", 0);
                } catch (Throwable unused3) {
                    Typeface typeface = Typeface.SANS_SERIF;
                    this.regularFont = typeface;
                    if (typeface == null) {
                        this.regularFont = Typeface.DEFAULT;
                    }
                }
            }
        }

        public final Context getContext() {
            return this.context;
        }

        public final int getItemColor() {
            return this.itemColor;
        }

        public final Typeface getRegularFont() {
            return this.regularFont;
        }

        private void checkSingleton() {
            if (ThemeSingleton.get(false) == null) {
                return;
            }
            ThemeSingleton themeSingleton = ThemeSingleton.get();
            if (themeSingleton.darkTheme) {
                this.theme = Theme.DARK;
            }
            if (themeSingleton.titleColor != 0) {
                this.titleColor = themeSingleton.titleColor;
            }
            if (themeSingleton.contentColor != 0) {
                this.contentColor = themeSingleton.contentColor;
            }
            if (themeSingleton.positiveColor != null) {
                this.positiveColor = themeSingleton.positiveColor;
            }
            if (themeSingleton.neutralColor != null) {
                this.neutralColor = themeSingleton.neutralColor;
            }
            if (themeSingleton.negativeColor != null) {
                this.negativeColor = themeSingleton.negativeColor;
            }
            if (themeSingleton.itemColor != 0) {
                this.itemColor = themeSingleton.itemColor;
            }
            if (themeSingleton.icon != null) {
                this.icon = themeSingleton.icon;
            }
            if (themeSingleton.backgroundColor != 0) {
                this.backgroundColor = themeSingleton.backgroundColor;
            }
            if (themeSingleton.dividerColor != 0) {
                this.dividerColor = themeSingleton.dividerColor;
            }
            if (themeSingleton.btnSelectorStacked != 0) {
                this.btnSelectorStacked = themeSingleton.btnSelectorStacked;
            }
            if (themeSingleton.listSelector != 0) {
                this.listSelector = themeSingleton.listSelector;
            }
            if (themeSingleton.btnSelectorPositive != 0) {
                this.btnSelectorPositive = themeSingleton.btnSelectorPositive;
            }
            if (themeSingleton.btnSelectorNeutral != 0) {
                this.btnSelectorNeutral = themeSingleton.btnSelectorNeutral;
            }
            if (themeSingleton.btnSelectorNegative != 0) {
                this.btnSelectorNegative = themeSingleton.btnSelectorNegative;
            }
            if (themeSingleton.widgetColor != 0) {
                this.widgetColor = themeSingleton.widgetColor;
            }
            if (themeSingleton.linkColor != null) {
                this.linkColor = themeSingleton.linkColor;
            }
            this.titleGravity = themeSingleton.titleGravity;
            this.contentGravity = themeSingleton.contentGravity;
            this.btnStackedGravity = themeSingleton.btnStackedGravity;
            this.itemsGravity = themeSingleton.itemsGravity;
            this.buttonsGravity = themeSingleton.buttonsGravity;
        }

        public Builder title(int i) {
            title(this.context.getText(i));
            return this;
        }

        public Builder title(CharSequence charSequence) {
            this.title = charSequence;
            return this;
        }

        public Builder titleGravity(GravityEnum gravityEnum) {
            this.titleGravity = gravityEnum;
            return this;
        }

        public Builder buttonRippleColor(int i) {
            this.buttonRippleColor = i;
            return this;
        }

        public Builder buttonRippleColorRes(int i) {
            return buttonRippleColor(DialogUtils.getColor(this.context, i));
        }

        public Builder buttonRippleColorAttr(int i) {
            return buttonRippleColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder titleColor(int i) {
            this.titleColor = i;
            this.titleColorSet = true;
            return this;
        }

        public Builder titleColorRes(int i) {
            return titleColor(DialogUtils.getColor(this.context, i));
        }

        public Builder titleColorAttr(int i) {
            return titleColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder typeface(Typeface typeface, Typeface typeface2) {
            this.mediumFont = typeface;
            this.regularFont = typeface2;
            return this;
        }

        public Builder typeface(String str, String str2) {
            if (str != null && !str.trim().isEmpty()) {
                Typeface typeface = TypefaceHelper.get(this.context, str);
                this.mediumFont = typeface;
                if (typeface == null) {
                    throw new IllegalArgumentException("No font asset found for \"" + str + "\"");
                }
            }
            if (str2 != null && !str2.trim().isEmpty()) {
                Typeface typeface2 = TypefaceHelper.get(this.context, str2);
                this.regularFont = typeface2;
                if (typeface2 == null) {
                    throw new IllegalArgumentException("No font asset found for \"" + str2 + "\"");
                }
            }
            return this;
        }

        public Builder icon(Drawable drawable) {
            this.icon = drawable;
            return this;
        }

        public Builder iconRes(int i) {
            this.icon = ResourcesCompat.getDrawable(this.context.getResources(), i, null);
            return this;
        }

        public Builder iconAttr(int i) {
            this.icon = DialogUtils.resolveDrawable(this.context, i);
            return this;
        }

        public Builder content(int i) {
            return content(i, false);
        }

        public Builder content(int i, boolean z) {
            CharSequence text = this.context.getText(i);
            if (z) {
                text = Html.fromHtml(text.toString().replace(IOUtils.LINE_SEPARATOR_UNIX, "<br/>"));
            }
            return content(text);
        }

        public Builder content(CharSequence charSequence) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set content() when you're using a custom view.");
            }
            this.content = charSequence;
            return this;
        }

        public Builder content(int i, Object... objArr) {
            return content(Html.fromHtml(String.format(this.context.getString(i), objArr).replace(IOUtils.LINE_SEPARATOR_UNIX, "<br/>")));
        }

        public Builder contentColor(int i) {
            this.contentColor = i;
            this.contentColorSet = true;
            return this;
        }

        public Builder contentColorRes(int i) {
            contentColor(DialogUtils.getColor(this.context, i));
            return this;
        }

        public Builder contentColorAttr(int i) {
            contentColor(DialogUtils.resolveColor(this.context, i));
            return this;
        }

        public Builder contentGravity(GravityEnum gravityEnum) {
            this.contentGravity = gravityEnum;
            return this;
        }

        public Builder contentLineSpacing(float f) {
            this.contentLineSpacingMultiplier = f;
            return this;
        }

        public Builder items(Collection collection) {
            if (collection.size() > 0) {
                CharSequence[] charSequenceArr = new CharSequence[collection.size()];
                int i = 0;
                Iterator it = collection.iterator();
                while (it.hasNext()) {
                    charSequenceArr[i] = it.next().toString();
                    i++;
                }
                items(charSequenceArr);
            } else if (collection.size() == 0) {
                this.items = new ArrayList<>();
            }
            return this;
        }

        public Builder items(int i) {
            items(this.context.getResources().getTextArray(i));
            return this;
        }

        public Builder items(CharSequence... charSequenceArr) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set items() when you're using a custom view.");
            }
            ArrayList<CharSequence> arrayList = new ArrayList<>();
            this.items = arrayList;
            Collections.addAll(arrayList, charSequenceArr);
            return this;
        }

        public Builder itemsCallback(ListCallback listCallback) {
            this.listCallback = listCallback;
            this.listCallbackSingleChoice = null;
            this.listCallbackMultiChoice = null;
            return this;
        }

        public Builder itemsLongCallback(ListLongCallback listLongCallback) {
            this.listLongCallback = listLongCallback;
            this.listCallbackSingleChoice = null;
            this.listCallbackMultiChoice = null;
            return this;
        }

        public Builder itemsColor(int i) {
            this.itemColor = i;
            this.itemColorSet = true;
            return this;
        }

        public Builder itemsColorRes(int i) {
            return itemsColor(DialogUtils.getColor(this.context, i));
        }

        public Builder itemsColorAttr(int i) {
            return itemsColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder itemsGravity(GravityEnum gravityEnum) {
            this.itemsGravity = gravityEnum;
            return this;
        }

        public Builder itemsIds(int[] iArr) {
            this.itemIds = iArr;
            return this;
        }

        public Builder itemsIds(int i) {
            return itemsIds(this.context.getResources().getIntArray(i));
        }

        public Builder buttonsGravity(GravityEnum gravityEnum) {
            this.buttonsGravity = gravityEnum;
            return this;
        }

        public Builder itemsCallbackSingleChoice(int i, ListCallbackSingleChoice listCallbackSingleChoice) {
            this.selectedIndex = i;
            this.listCallback = null;
            this.listCallbackSingleChoice = listCallbackSingleChoice;
            this.listCallbackMultiChoice = null;
            return this;
        }

        public Builder alwaysCallSingleChoiceCallback() {
            this.alwaysCallSingleChoiceCallback = true;
            return this;
        }

        public Builder itemsCallbackMultiChoice(Integer[] numArr, ListCallbackMultiChoice listCallbackMultiChoice) {
            this.selectedIndices = numArr;
            this.listCallback = null;
            this.listCallbackSingleChoice = null;
            this.listCallbackMultiChoice = listCallbackMultiChoice;
            return this;
        }

        public Builder itemsDisabledIndices(Integer... numArr) {
            this.disabledIndices = numArr;
            return this;
        }

        public Builder alwaysCallMultiChoiceCallback() {
            this.alwaysCallMultiChoiceCallback = true;
            return this;
        }

        public Builder positiveText(int i) {
            if (i == 0) {
                return this;
            }
            positiveText(this.context.getText(i));
            return this;
        }

        public Builder positiveText(CharSequence charSequence) {
            this.positiveText = charSequence;
            return this;
        }

        public Builder positiveColor(int i) {
            return positiveColor(DialogUtils.getActionTextStateList(this.context, i));
        }

        public Builder positiveColorRes(int i) {
            return positiveColor(DialogUtils.getActionTextColorStateList(this.context, i));
        }

        public Builder positiveColorAttr(int i) {
            return positiveColor(DialogUtils.resolveActionTextColorStateList(this.context, i, null));
        }

        public Builder positiveColor(ColorStateList colorStateList) {
            this.positiveColor = colorStateList;
            this.positiveColorSet = true;
            return this;
        }

        public Builder positiveFocus(boolean z) {
            this.positiveFocus = z;
            return this;
        }

        public Builder neutralText(int i) {
            return i == 0 ? this : neutralText(this.context.getText(i));
        }

        public Builder neutralText(CharSequence charSequence) {
            this.neutralText = charSequence;
            return this;
        }

        public Builder negativeColor(int i) {
            return negativeColor(DialogUtils.getActionTextStateList(this.context, i));
        }

        public Builder negativeColorRes(int i) {
            return negativeColor(DialogUtils.getActionTextColorStateList(this.context, i));
        }

        public Builder negativeColorAttr(int i) {
            return negativeColor(DialogUtils.resolveActionTextColorStateList(this.context, i, null));
        }

        public Builder negativeColor(ColorStateList colorStateList) {
            this.negativeColor = colorStateList;
            this.negativeColorSet = true;
            return this;
        }

        public Builder negativeText(int i) {
            return i == 0 ? this : negativeText(this.context.getText(i));
        }

        public Builder negativeText(CharSequence charSequence) {
            this.negativeText = charSequence;
            return this;
        }

        public Builder negativeFocus(boolean z) {
            this.negativeFocus = z;
            return this;
        }

        public Builder neutralColor(int i) {
            return neutralColor(DialogUtils.getActionTextStateList(this.context, i));
        }

        public Builder neutralColorRes(int i) {
            return neutralColor(DialogUtils.getActionTextColorStateList(this.context, i));
        }

        public Builder neutralColorAttr(int i) {
            return neutralColor(DialogUtils.resolveActionTextColorStateList(this.context, i, null));
        }

        public Builder neutralColor(ColorStateList colorStateList) {
            this.neutralColor = colorStateList;
            this.neutralColorSet = true;
            return this;
        }

        public Builder neutralFocus(boolean z) {
            this.neutralFocus = z;
            return this;
        }

        public Builder linkColor(int i) {
            return linkColor(DialogUtils.getActionTextStateList(this.context, i));
        }

        public Builder linkColorRes(int i) {
            return linkColor(DialogUtils.getActionTextColorStateList(this.context, i));
        }

        public Builder linkColorAttr(int i) {
            return linkColor(DialogUtils.resolveActionTextColorStateList(this.context, i, null));
        }

        public Builder linkColor(ColorStateList colorStateList) {
            this.linkColor = colorStateList;
            return this;
        }

        public Builder listSelector(int i) {
            this.listSelector = i;
            return this;
        }

        public Builder btnSelectorStacked(int i) {
            this.btnSelectorStacked = i;
            return this;
        }

        public Builder btnSelector(int i) {
            this.btnSelectorPositive = i;
            this.btnSelectorNeutral = i;
            this.btnSelectorNegative = i;
            return this;
        }

        public Builder btnSelector(int i, DialogAction dialogAction) {
            int i2 = C03854.$SwitchMap$com$afollestad$materialdialogs$DialogAction[dialogAction.ordinal()];
            if (i2 == 1) {
                this.btnSelectorNeutral = i;
            } else if (i2 != 2) {
                this.btnSelectorPositive = i;
            } else {
                this.btnSelectorNegative = i;
            }
            return this;
        }

        public Builder btnStackedGravity(GravityEnum gravityEnum) {
            this.btnStackedGravity = gravityEnum;
            return this;
        }

        public Builder checkBoxPrompt(CharSequence charSequence, boolean z, CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
            this.checkBoxPrompt = charSequence;
            this.checkBoxPromptInitiallyChecked = z;
            this.checkBoxPromptListener = onCheckedChangeListener;
            return this;
        }

        public Builder checkBoxPromptRes(int i, boolean z, CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
            return checkBoxPrompt(this.context.getResources().getText(i), z, onCheckedChangeListener);
        }

        public Builder customView(int i, boolean z) {
            return customView(LayoutInflater.from(this.context).inflate(i, (ViewGroup) null), z);
        }

        public Builder customView(View view, boolean z) {
            if (this.content != null) {
                throw new IllegalStateException("You cannot use customView() when you have content set.");
            }
            if (this.items != null) {
                throw new IllegalStateException("You cannot use customView() when you have items set.");
            }
            if (this.inputCallback != null) {
                throw new IllegalStateException("You cannot use customView() with an input dialog");
            }
            if (this.progress > -2 || this.indeterminateProgress) {
                throw new IllegalStateException("You cannot use customView() with a progress dialog");
            }
            if (view.getParent() != null && (view.getParent() instanceof ViewGroup)) {
                ((ViewGroup) view.getParent()).removeView(view);
            }
            this.customView = view;
            this.wrapCustomViewInScroll = z;
            return this;
        }

        public Builder progress(boolean z, int i) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set progress() when you're using a custom view.");
            }
            if (z) {
                this.indeterminateProgress = true;
                this.progress = -2;
            } else {
                this.indeterminateIsHorizontalProgress = false;
                this.indeterminateProgress = false;
                this.progress = -1;
                this.progressMax = i;
            }
            return this;
        }

        public Builder progress(boolean z, int i, boolean z2) {
            this.showMinMax = z2;
            return progress(z, i);
        }

        public Builder progressNumberFormat(String str) {
            this.progressNumberFormat = str;
            return this;
        }

        public Builder progressPercentFormat(NumberFormat numberFormat) {
            this.progressPercentFormat = numberFormat;
            return this;
        }

        public Builder progressIndeterminateStyle(boolean z) {
            this.indeterminateIsHorizontalProgress = z;
            return this;
        }

        public Builder widgetColor(int i) {
            this.widgetColor = i;
            this.widgetColorSet = true;
            return this;
        }

        public Builder widgetColorRes(int i) {
            return widgetColor(DialogUtils.getColor(this.context, i));
        }

        public Builder widgetColorAttr(int i) {
            return widgetColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder choiceWidgetColor(ColorStateList colorStateList) {
            this.choiceWidgetColor = colorStateList;
            return this;
        }

        public Builder dividerColor(int i) {
            this.dividerColor = i;
            this.dividerColorSet = true;
            return this;
        }

        public Builder dividerColorRes(int i) {
            return dividerColor(DialogUtils.getColor(this.context, i));
        }

        public Builder dividerColorAttr(int i) {
            return dividerColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder backgroundColor(int i) {
            this.backgroundColor = i;
            return this;
        }

        public Builder backgroundColorRes(int i) {
            return backgroundColor(DialogUtils.getColor(this.context, i));
        }

        public Builder backgroundColorAttr(int i) {
            return backgroundColor(DialogUtils.resolveColor(this.context, i));
        }

        public Builder callback(ButtonCallback buttonCallback) {
            this.callback = buttonCallback;
            return this;
        }

        public Builder onPositive(SingleButtonCallback singleButtonCallback) {
            this.onPositiveCallback = singleButtonCallback;
            return this;
        }

        public Builder onNegative(SingleButtonCallback singleButtonCallback) {
            this.onNegativeCallback = singleButtonCallback;
            return this;
        }

        public Builder onNeutral(SingleButtonCallback singleButtonCallback) {
            this.onNeutralCallback = singleButtonCallback;
            return this;
        }

        public Builder onAny(SingleButtonCallback singleButtonCallback) {
            this.onAnyCallback = singleButtonCallback;
            return this;
        }

        public Builder theme(Theme theme) {
            this.theme = theme;
            return this;
        }

        public Builder cancelable(boolean z) {
            this.cancelable = z;
            this.canceledOnTouchOutside = z;
            return this;
        }

        public Builder canceledOnTouchOutside(boolean z) {
            this.canceledOnTouchOutside = z;
            return this;
        }

        public Builder autoDismiss(boolean z) {
            this.autoDismiss = z;
            return this;
        }

        public Builder adapter(RecyclerView.Adapter<?> adapter, RecyclerView.LayoutManager layoutManager) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set adapter() when you're using a custom view.");
            }
            if (layoutManager != null && !(layoutManager instanceof LinearLayoutManager) && !(layoutManager instanceof GridLayoutManager)) {
                throw new IllegalStateException("You can currently only use LinearLayoutManager and GridLayoutManager with this library.");
            }
            this.adapter = adapter;
            this.layoutManager = layoutManager;
            return this;
        }

        public Builder limitIconToDefaultSize() {
            this.limitIconToDefaultSize = true;
            return this;
        }

        public Builder maxIconSize(int i) {
            this.maxIconSize = i;
            return this;
        }

        public Builder maxIconSizeRes(int i) {
            return maxIconSize((int) this.context.getResources().getDimension(i));
        }

        public Builder showListener(DialogInterface.OnShowListener onShowListener) {
            this.showListener = onShowListener;
            return this;
        }

        public Builder dismissListener(DialogInterface.OnDismissListener onDismissListener) {
            this.dismissListener = onDismissListener;
            return this;
        }

        public Builder cancelListener(DialogInterface.OnCancelListener onCancelListener) {
            this.cancelListener = onCancelListener;
            return this;
        }

        public Builder keyListener(DialogInterface.OnKeyListener onKeyListener) {
            this.keyListener = onKeyListener;
            return this;
        }

        public Builder stackingBehavior(StackingBehavior stackingBehavior) {
            this.stackingBehavior = stackingBehavior;
            return this;
        }

        public Builder input(CharSequence charSequence, CharSequence charSequence2, boolean z, InputCallback inputCallback) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set content() when you're using a custom view.");
            }
            this.inputCallback = inputCallback;
            this.inputHint = charSequence;
            this.inputPrefill = charSequence2;
            this.inputAllowEmpty = z;
            return this;
        }

        public Builder input(CharSequence charSequence, CharSequence charSequence2, InputCallback inputCallback) {
            return input(charSequence, charSequence2, true, inputCallback);
        }

        public Builder input(int i, int i2, boolean z, InputCallback inputCallback) {
            return input(i == 0 ? null : this.context.getText(i), i2 != 0 ? this.context.getText(i2) : null, z, inputCallback);
        }

        public Builder input(int i, int i2, InputCallback inputCallback) {
            return input(i, i2, true, inputCallback);
        }

        public Builder inputType(int i) {
            this.inputType = i;
            return this;
        }

        public Builder inputRange(int i, int i2) {
            return inputRange(i, i2, 0);
        }

        public Builder inputRange(int i, int i2, int i3) {
            if (i < 0) {
                throw new IllegalArgumentException("Min length for input dialogs cannot be less than 0.");
            }
            this.inputMinLength = i;
            this.inputMaxLength = i2;
            if (i3 == 0) {
                this.inputRangeErrorColor = DialogUtils.getColor(this.context, C0386R.color.md_edittext_error);
            } else {
                this.inputRangeErrorColor = i3;
            }
            if (this.inputMinLength > 0) {
                this.inputAllowEmpty = false;
            }
            return this;
        }

        public Builder inputRangeRes(int i, int i2, int i3) {
            return inputRange(i, i2, DialogUtils.getColor(this.context, i3));
        }

        public Builder alwaysCallInputCallback() {
            this.alwaysCallInputCallback = true;
            return this;
        }

        public Builder tag(Object obj) {
            this.tag = obj;
            return this;
        }

        public MaterialDialog build() {
            return new MaterialDialog(this);
        }

        public MaterialDialog show() {
            MaterialDialog materialDialogBuild = build();
            materialDialogBuild.show();
            return materialDialogBuild;
        }
    }

    @Deprecated
    public static abstract class ButtonCallback {
        @Deprecated
        public void onAny(MaterialDialog materialDialog) {
        }

        @Deprecated
        public void onNegative(MaterialDialog materialDialog) {
        }

        @Deprecated
        public void onNeutral(MaterialDialog materialDialog) {
        }

        @Deprecated
        public void onPositive(MaterialDialog materialDialog) {
        }

        protected final Object clone() throws CloneNotSupportedException {
            return super.clone();
        }

        public final boolean equals(Object obj) {
            return super.equals(obj);
        }

        protected final void finalize() throws Throwable {
            super.finalize();
        }

        public final int hashCode() {
            return super.hashCode();
        }

        public final String toString() {
            return super.toString();
        }
    }
}
