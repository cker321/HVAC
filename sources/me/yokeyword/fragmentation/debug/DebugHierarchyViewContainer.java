package me.yokeyword.fragmentation.debug;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.core.view.ViewCompat;
import java.util.List;
import me.yokeyword.fragmentation.C0766R;

/* loaded from: classes.dex */
public class DebugHierarchyViewContainer extends ScrollView {
    private Context mContext;
    private int mItemHeight;
    private LinearLayout mLinearLayout;
    private int mPadding;
    private LinearLayout mTitleLayout;

    public DebugHierarchyViewContainer(Context context) {
        super(context);
        initView(context);
    }

    public DebugHierarchyViewContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView(context);
    }

    public DebugHierarchyViewContainer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView(context);
    }

    private void initView(Context context) {
        this.mContext = context;
        HorizontalScrollView horizontalScrollView = new HorizontalScrollView(context);
        LinearLayout linearLayout = new LinearLayout(context);
        this.mLinearLayout = linearLayout;
        linearLayout.setOrientation(1);
        horizontalScrollView.addView(this.mLinearLayout);
        addView(horizontalScrollView);
        this.mItemHeight = dip2px(50.0f);
        this.mPadding = dip2px(16.0f);
    }

    private int dip2px(float f) {
        return (int) ((f * this.mContext.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public void bindFragmentRecords(List<DebugFragmentRecord> list) {
        this.mLinearLayout.removeAllViews();
        this.mLinearLayout.addView(getTitleLayout());
        if (list == null) {
            return;
        }
        setView(list, 0, null);
    }

    private LinearLayout getTitleLayout() {
        LinearLayout linearLayout = this.mTitleLayout;
        if (linearLayout != null) {
            return linearLayout;
        }
        LinearLayout linearLayout2 = new LinearLayout(this.mContext);
        this.mTitleLayout = linearLayout2;
        linearLayout2.setPadding(dip2px(24.0f), dip2px(24.0f), 0, dip2px(8.0f));
        this.mTitleLayout.setOrientation(0);
        this.mTitleLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        TextView textView = new TextView(this.mContext);
        textView.setText(C0766R.string.fragmentation_stack_view);
        textView.setTextSize(20.0f);
        textView.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 16;
        textView.setLayoutParams(layoutParams);
        this.mTitleLayout.addView(textView);
        ImageView imageView = new ImageView(this.mContext);
        imageView.setImageResource(C0766R.drawable.fragmentation_help);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.leftMargin = dip2px(16.0f);
        layoutParams2.gravity = 16;
        imageView.setLayoutParams(layoutParams2);
        this.mTitleLayout.setOnClickListener(new View.OnClickListener() { // from class: me.yokeyword.fragmentation.debug.DebugHierarchyViewContainer.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Toast.makeText(DebugHierarchyViewContainer.this.mContext, C0766R.string.fragmentation_stack_help, 1).show();
            }
        });
        this.mTitleLayout.addView(imageView);
        return this.mTitleLayout;
    }

    private void setView(List<DebugFragmentRecord> list, int i, TextView textView) {
        for (int size = list.size() - 1; size >= 0; size--) {
            DebugFragmentRecord debugFragmentRecord = list.get(size);
            final TextView textView2 = getTextView(debugFragmentRecord, i);
            textView2.setTag(C0766R.id.hierarchy, Integer.valueOf(i));
            final List<DebugFragmentRecord> list2 = debugFragmentRecord.childFragmentRecord;
            if (list2 != null && list2.size() > 0) {
                final int i2 = i + 1;
                textView2.setCompoundDrawablesWithIntrinsicBounds(C0766R.drawable.fragmentation_ic_right, 0, 0, 0);
                textView2.setOnClickListener(new View.OnClickListener() { // from class: me.yokeyword.fragmentation.debug.DebugHierarchyViewContainer.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        if (view.getTag(C0766R.id.isexpand) != null) {
                            boolean zBooleanValue = ((Boolean) view.getTag(C0766R.id.isexpand)).booleanValue();
                            if (!zBooleanValue) {
                                DebugHierarchyViewContainer.this.handleExpandView(list2, i2, textView2);
                            } else {
                                textView2.setCompoundDrawablesWithIntrinsicBounds(C0766R.drawable.fragmentation_ic_right, 0, 0, 0);
                                DebugHierarchyViewContainer.this.removeView(i2);
                            }
                            view.setTag(C0766R.id.isexpand, Boolean.valueOf(!zBooleanValue));
                            return;
                        }
                        textView2.setTag(C0766R.id.isexpand, true);
                        DebugHierarchyViewContainer.this.handleExpandView(list2, i2, textView2);
                    }
                });
            } else {
                int paddingLeft = textView2.getPaddingLeft();
                int i3 = this.mPadding;
                textView2.setPadding(paddingLeft + i3, 0, i3, 0);
            }
            if (textView == null) {
                this.mLinearLayout.addView(textView2);
            } else {
                LinearLayout linearLayout = this.mLinearLayout;
                linearLayout.addView(textView2, linearLayout.indexOfChild(textView) + 1);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleExpandView(List<DebugFragmentRecord> list, int i, TextView textView) {
        setView(list, i, textView);
        textView.setCompoundDrawablesWithIntrinsicBounds(C0766R.drawable.fragmentation_ic_expandable, 0, 0, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeView(int i) {
        for (int childCount = this.mLinearLayout.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = this.mLinearLayout.getChildAt(childCount);
            if (childAt.getTag(C0766R.id.hierarchy) != null && ((Integer) childAt.getTag(C0766R.id.hierarchy)).intValue() >= i) {
                this.mLinearLayout.removeView(childAt);
            }
        }
    }

    private TextView getTextView(DebugFragmentRecord debugFragmentRecord, int i) {
        TextView textView = new TextView(this.mContext);
        textView.setLayoutParams(new ViewGroup.LayoutParams(-1, this.mItemHeight));
        if (i == 0) {
            textView.setTextColor(Color.parseColor("#333333"));
            textView.setTextSize(16.0f);
        }
        textView.setGravity(16);
        int i2 = this.mPadding;
        double d = i2;
        double d2 = i * i2;
        Double.isNaN(d2);
        Double.isNaN(d);
        textView.setPadding((int) (d + (d2 * 1.5d)), 0, i2, 0);
        textView.setCompoundDrawablePadding(this.mPadding / 2);
        TypedArray typedArrayObtainStyledAttributes = this.mContext.obtainStyledAttributes(new int[]{R.attr.selectableItemBackground});
        textView.setBackgroundDrawable(typedArrayObtainStyledAttributes.getDrawable(0));
        typedArrayObtainStyledAttributes.recycle();
        textView.setText(debugFragmentRecord.fragmentName);
        return textView;
    }
}
