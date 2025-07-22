package es.dmoral.toasty;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Build;
import android.view.View;

/* loaded from: classes.dex */
final class ToastyUtils {
    private ToastyUtils() {
    }

    static Drawable tintIcon(Drawable drawable, int i) {
        drawable.setColorFilter(i, PorterDuff.Mode.SRC_IN);
        return drawable;
    }

    static Drawable tint9PatchDrawableFrame(Context context, int i) {
        return tintIcon((NinePatchDrawable) getDrawable(context, C0748R.drawable.toast_frame), i);
    }

    static void setBackground(View view, Drawable drawable) {
        if (Build.VERSION.SDK_INT >= 16) {
            view.setBackground(drawable);
        } else {
            view.setBackgroundDrawable(drawable);
        }
    }

    static Drawable getDrawable(Context context, int i) {
        if (Build.VERSION.SDK_INT >= 21) {
            return context.getDrawable(i);
        }
        return context.getResources().getDrawable(i);
    }
}
