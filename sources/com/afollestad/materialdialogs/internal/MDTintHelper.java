package com.afollestad.materialdialogs.internal;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.SeekBar;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatEditText;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.drawable.DrawableCompat;
import com.afollestad.materialdialogs.C0386R;
import com.afollestad.materialdialogs.util.DialogUtils;
import java.lang.reflect.Field;

/* loaded from: classes.dex */
public class MDTintHelper {
    public static void setTint(RadioButton radioButton, ColorStateList colorStateList) {
        if (Build.VERSION.SDK_INT >= 22) {
            radioButton.setButtonTintList(colorStateList);
            return;
        }
        Drawable drawableWrap = DrawableCompat.wrap(ContextCompat.getDrawable(radioButton.getContext(), C0386R.drawable.abc_btn_radio_material));
        DrawableCompat.setTintList(drawableWrap, colorStateList);
        radioButton.setButtonDrawable(drawableWrap);
    }

    public static void setTint(RadioButton radioButton, int i) {
        int disabledColor = DialogUtils.getDisabledColor(radioButton.getContext());
        setTint(radioButton, new ColorStateList(new int[][]{new int[]{R.attr.state_enabled, -16842912}, new int[]{R.attr.state_enabled, R.attr.state_checked}, new int[]{-16842910, -16842912}, new int[]{-16842910, R.attr.state_checked}}, new int[]{DialogUtils.resolveColor(radioButton.getContext(), C0386R.attr.colorControlNormal), i, disabledColor, disabledColor}));
    }

    public static void setTint(CheckBox checkBox, ColorStateList colorStateList) {
        if (Build.VERSION.SDK_INT >= 22) {
            checkBox.setButtonTintList(colorStateList);
            return;
        }
        Drawable drawableWrap = DrawableCompat.wrap(ContextCompat.getDrawable(checkBox.getContext(), C0386R.drawable.abc_btn_check_material));
        DrawableCompat.setTintList(drawableWrap, colorStateList);
        checkBox.setButtonDrawable(drawableWrap);
    }

    public static void setTint(CheckBox checkBox, int i) {
        int disabledColor = DialogUtils.getDisabledColor(checkBox.getContext());
        setTint(checkBox, new ColorStateList(new int[][]{new int[]{R.attr.state_enabled, -16842912}, new int[]{R.attr.state_enabled, R.attr.state_checked}, new int[]{-16842910, -16842912}, new int[]{-16842910, R.attr.state_checked}}, new int[]{DialogUtils.resolveColor(checkBox.getContext(), C0386R.attr.colorControlNormal), i, disabledColor, disabledColor}));
    }

    public static void setTint(SeekBar seekBar, int i) {
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(i);
        if (Build.VERSION.SDK_INT >= 21) {
            seekBar.setThumbTintList(colorStateListValueOf);
            seekBar.setProgressTintList(colorStateListValueOf);
            return;
        }
        if (Build.VERSION.SDK_INT > 10) {
            Drawable drawableWrap = DrawableCompat.wrap(seekBar.getProgressDrawable());
            seekBar.setProgressDrawable(drawableWrap);
            DrawableCompat.setTintList(drawableWrap, colorStateListValueOf);
            if (Build.VERSION.SDK_INT >= 16) {
                Drawable drawableWrap2 = DrawableCompat.wrap(seekBar.getThumb());
                DrawableCompat.setTintList(drawableWrap2, colorStateListValueOf);
                seekBar.setThumb(drawableWrap2);
                return;
            }
            return;
        }
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        if (Build.VERSION.SDK_INT <= 10) {
            mode = PorterDuff.Mode.MULTIPLY;
        }
        if (seekBar.getIndeterminateDrawable() != null) {
            seekBar.getIndeterminateDrawable().setColorFilter(i, mode);
        }
        if (seekBar.getProgressDrawable() != null) {
            seekBar.getProgressDrawable().setColorFilter(i, mode);
        }
    }

    public static void setTint(ProgressBar progressBar, int i) {
        setTint(progressBar, i, false);
    }

    private static void setTint(ProgressBar progressBar, int i, boolean z) {
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(i);
        if (Build.VERSION.SDK_INT >= 21) {
            progressBar.setProgressTintList(colorStateListValueOf);
            progressBar.setSecondaryProgressTintList(colorStateListValueOf);
            if (z) {
                return;
            }
            progressBar.setIndeterminateTintList(colorStateListValueOf);
            return;
        }
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        if (Build.VERSION.SDK_INT <= 10) {
            mode = PorterDuff.Mode.MULTIPLY;
        }
        if (!z && progressBar.getIndeterminateDrawable() != null) {
            progressBar.getIndeterminateDrawable().setColorFilter(i, mode);
        }
        if (progressBar.getProgressDrawable() != null) {
            progressBar.getProgressDrawable().setColorFilter(i, mode);
        }
    }

    private static ColorStateList createEditTextColorStateList(Context context, int i) {
        return new ColorStateList(new int[][]{new int[]{-16842910}, new int[]{-16842919, -16842908}, new int[0]}, new int[]{DialogUtils.resolveColor(context, C0386R.attr.colorControlNormal), DialogUtils.resolveColor(context, C0386R.attr.colorControlNormal), i});
    }

    public static void setTint(EditText editText, int i) {
        ColorStateList colorStateListCreateEditTextColorStateList = createEditTextColorStateList(editText.getContext(), i);
        if (editText instanceof AppCompatEditText) {
            ((AppCompatEditText) editText).setSupportBackgroundTintList(colorStateListCreateEditTextColorStateList);
        } else if (Build.VERSION.SDK_INT >= 21) {
            editText.setBackgroundTintList(colorStateListCreateEditTextColorStateList);
        }
        setCursorTint(editText, i);
    }

    private static void setCursorTint(EditText editText, int i) throws IllegalAccessException, NoSuchFieldException, IllegalArgumentException {
        try {
            Field declaredField = TextView.class.getDeclaredField("mCursorDrawableRes");
            declaredField.setAccessible(true);
            int i2 = declaredField.getInt(editText);
            Field declaredField2 = TextView.class.getDeclaredField("mEditor");
            declaredField2.setAccessible(true);
            Object obj = declaredField2.get(editText);
            Field declaredField3 = obj.getClass().getDeclaredField("mCursorDrawable");
            declaredField3.setAccessible(true);
            Drawable[] drawableArr = {ContextCompat.getDrawable(editText.getContext(), i2), ContextCompat.getDrawable(editText.getContext(), i2)};
            drawableArr[0].setColorFilter(i, PorterDuff.Mode.SRC_IN);
            drawableArr[1].setColorFilter(i, PorterDuff.Mode.SRC_IN);
            declaredField3.set(obj, drawableArr);
        } catch (NoSuchFieldException e) {
            Log.d("MDTintHelper", "Device issue with cursor tinting: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
