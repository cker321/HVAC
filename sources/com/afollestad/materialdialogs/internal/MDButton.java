package com.afollestad.materialdialogs.internal;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.TextView;
import com.afollestad.materialdialogs.C0386R;
import com.afollestad.materialdialogs.GravityEnum;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: classes.dex */
public class MDButton extends TextView {
    private Drawable defaultBackground;
    private boolean stacked;
    private Drawable stackedBackground;
    private int stackedEndPadding;
    private GravityEnum stackedGravity;

    public MDButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.stacked = false;
        init(context);
    }

    public MDButton(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.stacked = false;
        init(context);
    }

    private void init(Context context) {
        this.stackedEndPadding = context.getResources().getDimensionPixelSize(C0386R.dimen.md_dialog_frame_margin);
        this.stackedGravity = GravityEnum.END;
    }

    void setStacked(boolean z, boolean z2) {
        if (this.stacked != z || z2) {
            setGravity(z ? this.stackedGravity.getGravityInt() | 16 : 17);
            if (Build.VERSION.SDK_INT >= 17) {
                setTextAlignment(z ? this.stackedGravity.getTextAlignment() : 4);
            }
            DialogUtils.setBackgroundCompat(this, z ? this.stackedBackground : this.defaultBackground);
            if (z) {
                setPadding(this.stackedEndPadding, getPaddingTop(), this.stackedEndPadding, getPaddingBottom());
            }
            this.stacked = z;
        }
    }

    public void setStackedGravity(GravityEnum gravityEnum) {
        this.stackedGravity = gravityEnum;
    }

    public void setStackedSelector(Drawable drawable) {
        this.stackedBackground = drawable;
        if (this.stacked) {
            setStacked(true, true);
        }
    }

    public void setDefaultSelector(Drawable drawable) {
        this.defaultBackground = drawable;
        if (this.stacked) {
            return;
        }
        setStacked(false, true);
    }

    public void setAllCapsCompat(boolean z) {
        if (Build.VERSION.SDK_INT >= 14) {
            setAllCaps(z);
        } else if (z) {
            setTransformationMethod(new AllCapsTransformationMethod(getContext()));
        } else {
            setTransformationMethod(null);
        }
    }
}
