package es.dmoral.toasty;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

/* loaded from: classes.dex */
public class Toasty {
    private static final Typeface LOADED_TOAST_TYPEFACE;
    private static Typeface currentTypeface;
    private static boolean tintIcon;
    private static int DEFAULT_TEXT_COLOR = Color.parseColor("#FFFFFF");
    private static int ERROR_COLOR = Color.parseColor("#D50000");
    private static int INFO_COLOR = Color.parseColor("#3F51B5");
    private static int SUCCESS_COLOR = Color.parseColor("#388E3C");
    private static int WARNING_COLOR = Color.parseColor("#FFA900");

    static {
        Typeface typefaceCreate = Typeface.create("sans-serif-condensed", 0);
        LOADED_TOAST_TYPEFACE = typefaceCreate;
        currentTypeface = typefaceCreate;
        tintIcon = true;
    }

    private Toasty() {
    }

    public static Toast normal(Context context, CharSequence charSequence) {
        return normal(context, charSequence, 0, null, false);
    }

    public static Toast normal(Context context, CharSequence charSequence, Drawable drawable) {
        return normal(context, charSequence, 0, drawable, true);
    }

    public static Toast normal(Context context, CharSequence charSequence, int i) {
        return normal(context, charSequence, i, null, false);
    }

    public static Toast normal(Context context, CharSequence charSequence, int i, Drawable drawable) {
        return normal(context, charSequence, i, drawable, true);
    }

    public static Toast normal(Context context, CharSequence charSequence, int i, Drawable drawable, boolean z) {
        return custom(context, charSequence, drawable, i, z);
    }

    public static Toast warning(Context context, CharSequence charSequence) {
        return warning(context, charSequence, 0, true);
    }

    public static Toast warning(Context context, CharSequence charSequence, int i) {
        return warning(context, charSequence, i, true);
    }

    public static Toast warning(Context context, CharSequence charSequence, int i, boolean z) {
        return custom(context, charSequence, ToastyUtils.getDrawable(context, C0748R.drawable.ic_error_outline_white_48dp), WARNING_COLOR, i, z, true);
    }

    public static Toast info(Context context, CharSequence charSequence) {
        return info(context, charSequence, 0, true);
    }

    public static Toast info(Context context, CharSequence charSequence, int i) {
        return info(context, charSequence, i, true);
    }

    public static Toast info(Context context, CharSequence charSequence, int i, boolean z) {
        return custom(context, charSequence, ToastyUtils.getDrawable(context, C0748R.drawable.ic_info_outline_white_48dp), INFO_COLOR, i, z, true);
    }

    public static Toast success(Context context, CharSequence charSequence) {
        return success(context, charSequence, 0, true);
    }

    public static Toast success(Context context, CharSequence charSequence, int i) {
        return success(context, charSequence, i, true);
    }

    public static Toast success(Context context, CharSequence charSequence, int i, boolean z) {
        return custom(context, charSequence, ToastyUtils.getDrawable(context, C0748R.drawable.ic_check_white_48dp), SUCCESS_COLOR, i, z, true);
    }

    public static Toast error(Context context, CharSequence charSequence) {
        return error(context, charSequence, 0, true);
    }

    public static Toast error(Context context, CharSequence charSequence, int i) {
        return error(context, charSequence, i, true);
    }

    public static Toast error(Context context, CharSequence charSequence, int i, boolean z) {
        return custom(context, charSequence, ToastyUtils.getDrawable(context, C0748R.drawable.ic_clear_white_48dp), ERROR_COLOR, i, z, true);
    }

    public static Toast custom(Context context, CharSequence charSequence, Drawable drawable, int i, boolean z) {
        return custom(context, charSequence, drawable, -1, i, z, false);
    }

    public static Toast custom(Context context, CharSequence charSequence, int i, int i2, int i3, boolean z, boolean z2) {
        return custom(context, charSequence, ToastyUtils.getDrawable(context, i), i2, i3, z, z2);
    }

    public static Toast custom(Context context, CharSequence charSequence, Drawable drawable, int i, int i2, boolean z, boolean z2) {
        Drawable drawable2;
        Toast toast = new Toast(context);
        View viewInflate = ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(C0748R.layout.toast_layout, (ViewGroup) null);
        ImageView imageView = (ImageView) viewInflate.findViewById(C0748R.id.toast_icon);
        TextView textView = (TextView) viewInflate.findViewById(C0748R.id.toast_text);
        if (z2) {
            drawable2 = ToastyUtils.tint9PatchDrawableFrame(context, i);
        } else {
            drawable2 = ToastyUtils.getDrawable(context, C0748R.drawable.toast_frame);
        }
        ToastyUtils.setBackground(viewInflate, drawable2);
        if (!z) {
            imageView.setVisibility(8);
        } else {
            if (drawable == null) {
                throw new IllegalArgumentException("Avoid passing 'icon' as null if 'withIcon' is set to true");
            }
            if (tintIcon) {
                drawable = ToastyUtils.tintIcon(drawable, DEFAULT_TEXT_COLOR);
            }
            ToastyUtils.setBackground(imageView, drawable);
        }
        textView.setTextColor(DEFAULT_TEXT_COLOR);
        textView.setText(charSequence);
        textView.setTypeface(currentTypeface);
        toast.setView(viewInflate);
        toast.setDuration(i2);
        return toast;
    }

    public static class Config {
        private int DEFAULT_TEXT_COLOR = Toasty.DEFAULT_TEXT_COLOR;
        private int ERROR_COLOR = Toasty.ERROR_COLOR;
        private int INFO_COLOR = Toasty.INFO_COLOR;
        private int SUCCESS_COLOR = Toasty.SUCCESS_COLOR;
        private int WARNING_COLOR = Toasty.WARNING_COLOR;
        private Typeface typeface = Toasty.currentTypeface;
        private boolean tintIcon = Toasty.tintIcon;

        private Config() {
        }

        public static Config getInstance() {
            return new Config();
        }

        public static void reset() {
            int unused = Toasty.DEFAULT_TEXT_COLOR = Color.parseColor("#FFFFFF");
            int unused2 = Toasty.ERROR_COLOR = Color.parseColor("#D50000");
            int unused3 = Toasty.INFO_COLOR = Color.parseColor("#3F51B5");
            int unused4 = Toasty.SUCCESS_COLOR = Color.parseColor("#388E3C");
            int unused5 = Toasty.WARNING_COLOR = Color.parseColor("#FFA900");
            Typeface unused6 = Toasty.currentTypeface = Toasty.LOADED_TOAST_TYPEFACE;
            boolean unused7 = Toasty.tintIcon = true;
        }

        public Config setTextColor(int i) {
            this.DEFAULT_TEXT_COLOR = i;
            return this;
        }

        public Config setErrorColor(int i) {
            this.ERROR_COLOR = i;
            return this;
        }

        public Config setInfoColor(int i) {
            this.INFO_COLOR = i;
            return this;
        }

        public Config setSuccessColor(int i) {
            this.SUCCESS_COLOR = i;
            return this;
        }

        public Config setWarningColor(int i) {
            this.WARNING_COLOR = i;
            return this;
        }

        public Config setToastTypeface(Typeface typeface) {
            this.typeface = typeface;
            return this;
        }

        public Config tintIcon(boolean z) {
            this.tintIcon = z;
            return this;
        }

        public void apply() {
            int unused = Toasty.DEFAULT_TEXT_COLOR = this.DEFAULT_TEXT_COLOR;
            int unused2 = Toasty.ERROR_COLOR = this.ERROR_COLOR;
            int unused3 = Toasty.INFO_COLOR = this.INFO_COLOR;
            int unused4 = Toasty.SUCCESS_COLOR = this.SUCCESS_COLOR;
            int unused5 = Toasty.WARNING_COLOR = this.WARNING_COLOR;
            Typeface unused6 = Toasty.currentTypeface = this.typeface;
            boolean unused7 = Toasty.tintIcon = this.tintIcon;
        }
    }
}
