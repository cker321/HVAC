package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.LocaleList;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.widget.TextView;
import androidx.appcompat.C0036R;
import androidx.core.content.res.ResourcesCompat;
import androidx.core.view.ViewCompat;
import androidx.core.widget.AutoSizeableTextView;
import androidx.core.widget.TextViewCompat;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.util.Locale;

/* loaded from: classes.dex */
class AppCompatTextHelper {
    private static final int MONOSPACE = 3;
    private static final int SANS = 1;
    private static final int SERIF = 2;
    private static final int TEXT_FONT_WEIGHT_UNSPECIFIED = -1;
    private boolean mAsyncFontPending;
    private final AppCompatTextViewAutoSizeHelper mAutoSizeTextHelper;
    private TintInfo mDrawableBottomTint;
    private TintInfo mDrawableEndTint;
    private TintInfo mDrawableLeftTint;
    private TintInfo mDrawableRightTint;
    private TintInfo mDrawableStartTint;
    private TintInfo mDrawableTint;
    private TintInfo mDrawableTopTint;
    private Typeface mFontTypeface;
    private final TextView mView;
    private int mStyle = 0;
    private int mFontWeight = -1;

    AppCompatTextHelper(TextView textView) {
        this.mView = textView;
        this.mAutoSizeTextHelper = new AppCompatTextViewAutoSizeHelper(this.mView);
    }

    void loadFromAttributes(AttributeSet attributeSet, int i) {
        ColorStateList colorStateList;
        String string;
        boolean z;
        boolean z2;
        ColorStateList colorStateList2;
        String string2;
        ColorStateList colorStateList3;
        boolean z3;
        int i2;
        Context context = this.mView.getContext();
        AppCompatDrawableManager appCompatDrawableManager = AppCompatDrawableManager.get();
        TintTypedArray tintTypedArrayObtainStyledAttributes = TintTypedArray.obtainStyledAttributes(context, attributeSet, C0036R.styleable.AppCompatTextHelper, i, 0);
        TextView textView = this.mView;
        ViewCompat.saveAttributeDataForStyleable(textView, textView.getContext(), C0036R.styleable.AppCompatTextHelper, attributeSet, tintTypedArrayObtainStyledAttributes.getWrappedTypeArray(), i, 0);
        int resourceId = tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_textAppearance, -1);
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableLeft)) {
            this.mDrawableLeftTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableLeft, 0));
        }
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableTop)) {
            this.mDrawableTopTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableTop, 0));
        }
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableRight)) {
            this.mDrawableRightTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableRight, 0));
        }
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableBottom)) {
            this.mDrawableBottomTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableBottom, 0));
        }
        if (Build.VERSION.SDK_INT >= 17) {
            if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableStart)) {
                this.mDrawableStartTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableStart, 0));
            }
            if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.AppCompatTextHelper_android_drawableEnd)) {
                this.mDrawableEndTint = createTintInfo(context, appCompatDrawableManager, tintTypedArrayObtainStyledAttributes.getResourceId(C0036R.styleable.AppCompatTextHelper_android_drawableEnd, 0));
            }
        }
        tintTypedArrayObtainStyledAttributes.recycle();
        boolean z4 = this.mView.getTransformationMethod() instanceof PasswordTransformationMethod;
        if (resourceId != -1) {
            TintTypedArray tintTypedArrayObtainStyledAttributes2 = TintTypedArray.obtainStyledAttributes(context, resourceId, C0036R.styleable.TextAppearance);
            if (z4 || !tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_textAllCaps)) {
                z = false;
                z2 = false;
            } else {
                z = tintTypedArrayObtainStyledAttributes2.getBoolean(C0036R.styleable.TextAppearance_textAllCaps, false);
                z2 = true;
            }
            updateTypefaceAndStyle(context, tintTypedArrayObtainStyledAttributes2);
            if (Build.VERSION.SDK_INT < 23) {
                colorStateList3 = tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_android_textColor) ? tintTypedArrayObtainStyledAttributes2.getColorStateList(C0036R.styleable.TextAppearance_android_textColor) : null;
                colorStateList = tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_android_textColorHint) ? tintTypedArrayObtainStyledAttributes2.getColorStateList(C0036R.styleable.TextAppearance_android_textColorHint) : null;
                colorStateList2 = tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_android_textColorLink) ? tintTypedArrayObtainStyledAttributes2.getColorStateList(C0036R.styleable.TextAppearance_android_textColorLink) : null;
            } else {
                colorStateList = null;
                colorStateList2 = null;
                colorStateList3 = null;
            }
            string2 = tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_textLocale) ? tintTypedArrayObtainStyledAttributes2.getString(C0036R.styleable.TextAppearance_textLocale) : null;
            string = (Build.VERSION.SDK_INT < 26 || !tintTypedArrayObtainStyledAttributes2.hasValue(C0036R.styleable.TextAppearance_fontVariationSettings)) ? null : tintTypedArrayObtainStyledAttributes2.getString(C0036R.styleable.TextAppearance_fontVariationSettings);
            tintTypedArrayObtainStyledAttributes2.recycle();
        } else {
            colorStateList = null;
            string = null;
            z = false;
            z2 = false;
            colorStateList2 = null;
            string2 = null;
            colorStateList3 = null;
        }
        TintTypedArray tintTypedArrayObtainStyledAttributes3 = TintTypedArray.obtainStyledAttributes(context, attributeSet, C0036R.styleable.TextAppearance, i, 0);
        if (z4 || !tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_textAllCaps)) {
            z3 = z2;
        } else {
            z = tintTypedArrayObtainStyledAttributes3.getBoolean(C0036R.styleable.TextAppearance_textAllCaps, false);
            z3 = true;
        }
        if (Build.VERSION.SDK_INT < 23) {
            if (tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_android_textColor)) {
                colorStateList3 = tintTypedArrayObtainStyledAttributes3.getColorStateList(C0036R.styleable.TextAppearance_android_textColor);
            }
            if (tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_android_textColorHint)) {
                colorStateList = tintTypedArrayObtainStyledAttributes3.getColorStateList(C0036R.styleable.TextAppearance_android_textColorHint);
            }
            if (tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_android_textColorLink)) {
                colorStateList2 = tintTypedArrayObtainStyledAttributes3.getColorStateList(C0036R.styleable.TextAppearance_android_textColorLink);
            }
        }
        if (tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_textLocale)) {
            string2 = tintTypedArrayObtainStyledAttributes3.getString(C0036R.styleable.TextAppearance_textLocale);
        }
        if (Build.VERSION.SDK_INT >= 26 && tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_fontVariationSettings)) {
            string = tintTypedArrayObtainStyledAttributes3.getString(C0036R.styleable.TextAppearance_fontVariationSettings);
        }
        if (Build.VERSION.SDK_INT >= 28 && tintTypedArrayObtainStyledAttributes3.hasValue(C0036R.styleable.TextAppearance_android_textSize) && tintTypedArrayObtainStyledAttributes3.getDimensionPixelSize(C0036R.styleable.TextAppearance_android_textSize, -1) == 0) {
            this.mView.setTextSize(0, 0.0f);
        }
        updateTypefaceAndStyle(context, tintTypedArrayObtainStyledAttributes3);
        tintTypedArrayObtainStyledAttributes3.recycle();
        if (colorStateList3 != null) {
            this.mView.setTextColor(colorStateList3);
        }
        if (colorStateList != null) {
            this.mView.setHintTextColor(colorStateList);
        }
        if (colorStateList2 != null) {
            this.mView.setLinkTextColor(colorStateList2);
        }
        if (!z4 && z3) {
            setAllCaps(z);
        }
        Typeface typeface = this.mFontTypeface;
        if (typeface != null) {
            if (this.mFontWeight == -1) {
                this.mView.setTypeface(typeface, this.mStyle);
            } else {
                this.mView.setTypeface(typeface);
            }
        }
        if (string != null) {
            this.mView.setFontVariationSettings(string);
        }
        if (string2 != null) {
            if (Build.VERSION.SDK_INT >= 24) {
                this.mView.setTextLocales(LocaleList.forLanguageTags(string2));
            } else if (Build.VERSION.SDK_INT >= 21) {
                this.mView.setTextLocale(Locale.forLanguageTag(string2.substring(0, string2.indexOf(44))));
            }
        }
        this.mAutoSizeTextHelper.loadFromAttributes(attributeSet, i);
        if (AutoSizeableTextView.PLATFORM_SUPPORTS_AUTOSIZE && this.mAutoSizeTextHelper.getAutoSizeTextType() != 0) {
            int[] autoSizeTextAvailableSizes = this.mAutoSizeTextHelper.getAutoSizeTextAvailableSizes();
            if (autoSizeTextAvailableSizes.length > 0) {
                if (this.mView.getAutoSizeStepGranularity() != -1.0f) {
                    this.mView.setAutoSizeTextTypeUniformWithConfiguration(this.mAutoSizeTextHelper.getAutoSizeMinTextSize(), this.mAutoSizeTextHelper.getAutoSizeMaxTextSize(), this.mAutoSizeTextHelper.getAutoSizeStepGranularity(), 0);
                } else {
                    this.mView.setAutoSizeTextTypeUniformWithPresetSizes(autoSizeTextAvailableSizes, 0);
                }
            }
        }
        TintTypedArray tintTypedArrayObtainStyledAttributes4 = TintTypedArray.obtainStyledAttributes(context, attributeSet, C0036R.styleable.AppCompatTextView);
        int resourceId2 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableLeftCompat, -1);
        Drawable drawable = resourceId2 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId2) : null;
        int resourceId3 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableTopCompat, -1);
        Drawable drawable2 = resourceId3 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId3) : null;
        int resourceId4 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableRightCompat, -1);
        Drawable drawable3 = resourceId4 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId4) : null;
        int resourceId5 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableBottomCompat, -1);
        Drawable drawable4 = resourceId5 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId5) : null;
        int resourceId6 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableStartCompat, -1);
        Drawable drawable5 = resourceId6 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId6) : null;
        int resourceId7 = tintTypedArrayObtainStyledAttributes4.getResourceId(C0036R.styleable.AppCompatTextView_drawableEndCompat, -1);
        setCompoundDrawables(drawable, drawable2, drawable3, drawable4, drawable5, resourceId7 != -1 ? appCompatDrawableManager.getDrawable(context, resourceId7) : null);
        if (tintTypedArrayObtainStyledAttributes4.hasValue(C0036R.styleable.AppCompatTextView_drawableTint)) {
            TextViewCompat.setCompoundDrawableTintList(this.mView, tintTypedArrayObtainStyledAttributes4.getColorStateList(C0036R.styleable.AppCompatTextView_drawableTint));
        }
        if (tintTypedArrayObtainStyledAttributes4.hasValue(C0036R.styleable.AppCompatTextView_drawableTintMode)) {
            i2 = -1;
            TextViewCompat.setCompoundDrawableTintMode(this.mView, DrawableUtils.parseTintMode(tintTypedArrayObtainStyledAttributes4.getInt(C0036R.styleable.AppCompatTextView_drawableTintMode, -1), null));
        } else {
            i2 = -1;
        }
        int dimensionPixelSize = tintTypedArrayObtainStyledAttributes4.getDimensionPixelSize(C0036R.styleable.AppCompatTextView_firstBaselineToTopHeight, i2);
        int dimensionPixelSize2 = tintTypedArrayObtainStyledAttributes4.getDimensionPixelSize(C0036R.styleable.AppCompatTextView_lastBaselineToBottomHeight, i2);
        int dimensionPixelSize3 = tintTypedArrayObtainStyledAttributes4.getDimensionPixelSize(C0036R.styleable.AppCompatTextView_lineHeight, i2);
        tintTypedArrayObtainStyledAttributes4.recycle();
        if (dimensionPixelSize != i2) {
            TextViewCompat.setFirstBaselineToTopHeight(this.mView, dimensionPixelSize);
        }
        if (dimensionPixelSize2 != i2) {
            TextViewCompat.setLastBaselineToBottomHeight(this.mView, dimensionPixelSize2);
        }
        if (dimensionPixelSize3 != i2) {
            TextViewCompat.setLineHeight(this.mView, dimensionPixelSize3);
        }
    }

    private void updateTypefaceAndStyle(Context context, TintTypedArray tintTypedArray) {
        int i;
        String string;
        this.mStyle = tintTypedArray.getInt(C0036R.styleable.TextAppearance_android_textStyle, this.mStyle);
        if (Build.VERSION.SDK_INT >= 28) {
            int i2 = tintTypedArray.getInt(C0036R.styleable.TextAppearance_android_textFontWeight, -1);
            this.mFontWeight = i2;
            if (i2 != -1) {
                this.mStyle = (this.mStyle & 2) | 0;
            }
        }
        if (tintTypedArray.hasValue(C0036R.styleable.TextAppearance_android_fontFamily) || tintTypedArray.hasValue(C0036R.styleable.TextAppearance_fontFamily)) {
            this.mFontTypeface = null;
            if (tintTypedArray.hasValue(C0036R.styleable.TextAppearance_fontFamily)) {
                i = C0036R.styleable.TextAppearance_fontFamily;
            } else {
                i = C0036R.styleable.TextAppearance_android_fontFamily;
            }
            final int i3 = this.mFontWeight;
            final int i4 = this.mStyle;
            if (!context.isRestricted()) {
                final WeakReference weakReference = new WeakReference(this.mView);
                try {
                    Typeface font = tintTypedArray.getFont(i, this.mStyle, new ResourcesCompat.FontCallback() { // from class: androidx.appcompat.widget.AppCompatTextHelper.1
                        @Override // androidx.core.content.res.ResourcesCompat.FontCallback
                        public void onFontRetrievalFailed(int i5) {
                        }

                        @Override // androidx.core.content.res.ResourcesCompat.FontCallback
                        public void onFontRetrieved(Typeface typeface) {
                            int i5;
                            if (Build.VERSION.SDK_INT >= 28 && (i5 = i3) != -1) {
                                typeface = Typeface.create(typeface, i5, (i4 & 2) != 0);
                            }
                            AppCompatTextHelper.this.onAsyncTypefaceReceived(weakReference, typeface);
                        }
                    });
                    if (font != null) {
                        if (Build.VERSION.SDK_INT >= 28 && this.mFontWeight != -1) {
                            this.mFontTypeface = Typeface.create(Typeface.create(font, 0), this.mFontWeight, (this.mStyle & 2) != 0);
                        } else {
                            this.mFontTypeface = font;
                        }
                    }
                    this.mAsyncFontPending = this.mFontTypeface == null;
                } catch (Resources.NotFoundException | UnsupportedOperationException unused) {
                }
            }
            if (this.mFontTypeface != null || (string = tintTypedArray.getString(i)) == null) {
                return;
            }
            if (Build.VERSION.SDK_INT >= 28 && this.mFontWeight != -1) {
                this.mFontTypeface = Typeface.create(Typeface.create(string, 0), this.mFontWeight, (this.mStyle & 2) != 0);
                return;
            } else {
                this.mFontTypeface = Typeface.create(string, this.mStyle);
                return;
            }
        }
        if (tintTypedArray.hasValue(C0036R.styleable.TextAppearance_android_typeface)) {
            this.mAsyncFontPending = false;
            int i5 = tintTypedArray.getInt(C0036R.styleable.TextAppearance_android_typeface, 1);
            if (i5 == 1) {
                this.mFontTypeface = Typeface.SANS_SERIF;
            } else if (i5 == 2) {
                this.mFontTypeface = Typeface.SERIF;
            } else {
                if (i5 != 3) {
                    return;
                }
                this.mFontTypeface = Typeface.MONOSPACE;
            }
        }
    }

    void onAsyncTypefaceReceived(WeakReference<TextView> weakReference, Typeface typeface) {
        if (this.mAsyncFontPending) {
            this.mFontTypeface = typeface;
            TextView textView = weakReference.get();
            if (textView != null) {
                textView.setTypeface(typeface, this.mStyle);
            }
        }
    }

    void onSetTextAppearance(Context context, int i) {
        String string;
        ColorStateList colorStateList;
        TintTypedArray tintTypedArrayObtainStyledAttributes = TintTypedArray.obtainStyledAttributes(context, i, C0036R.styleable.TextAppearance);
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.TextAppearance_textAllCaps)) {
            setAllCaps(tintTypedArrayObtainStyledAttributes.getBoolean(C0036R.styleable.TextAppearance_textAllCaps, false));
        }
        if (Build.VERSION.SDK_INT < 23 && tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.TextAppearance_android_textColor) && (colorStateList = tintTypedArrayObtainStyledAttributes.getColorStateList(C0036R.styleable.TextAppearance_android_textColor)) != null) {
            this.mView.setTextColor(colorStateList);
        }
        if (tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.TextAppearance_android_textSize) && tintTypedArrayObtainStyledAttributes.getDimensionPixelSize(C0036R.styleable.TextAppearance_android_textSize, -1) == 0) {
            this.mView.setTextSize(0, 0.0f);
        }
        updateTypefaceAndStyle(context, tintTypedArrayObtainStyledAttributes);
        if (Build.VERSION.SDK_INT >= 26 && tintTypedArrayObtainStyledAttributes.hasValue(C0036R.styleable.TextAppearance_fontVariationSettings) && (string = tintTypedArrayObtainStyledAttributes.getString(C0036R.styleable.TextAppearance_fontVariationSettings)) != null) {
            this.mView.setFontVariationSettings(string);
        }
        tintTypedArrayObtainStyledAttributes.recycle();
        Typeface typeface = this.mFontTypeface;
        if (typeface != null) {
            this.mView.setTypeface(typeface, this.mStyle);
        }
    }

    void setAllCaps(boolean z) {
        this.mView.setAllCaps(z);
    }

    void onSetCompoundDrawables() {
        applyCompoundDrawablesTints();
    }

    void applyCompoundDrawablesTints() {
        if (this.mDrawableLeftTint != null || this.mDrawableTopTint != null || this.mDrawableRightTint != null || this.mDrawableBottomTint != null) {
            Drawable[] compoundDrawables = this.mView.getCompoundDrawables();
            applyCompoundDrawableTint(compoundDrawables[0], this.mDrawableLeftTint);
            applyCompoundDrawableTint(compoundDrawables[1], this.mDrawableTopTint);
            applyCompoundDrawableTint(compoundDrawables[2], this.mDrawableRightTint);
            applyCompoundDrawableTint(compoundDrawables[3], this.mDrawableBottomTint);
        }
        if (Build.VERSION.SDK_INT >= 17) {
            if (this.mDrawableStartTint == null && this.mDrawableEndTint == null) {
                return;
            }
            Drawable[] compoundDrawablesRelative = this.mView.getCompoundDrawablesRelative();
            applyCompoundDrawableTint(compoundDrawablesRelative[0], this.mDrawableStartTint);
            applyCompoundDrawableTint(compoundDrawablesRelative[2], this.mDrawableEndTint);
        }
    }

    private void applyCompoundDrawableTint(Drawable drawable, TintInfo tintInfo) {
        if (drawable == null || tintInfo == null) {
            return;
        }
        AppCompatDrawableManager.tintDrawable(drawable, tintInfo, this.mView.getDrawableState());
    }

    private static TintInfo createTintInfo(Context context, AppCompatDrawableManager appCompatDrawableManager, int i) {
        ColorStateList tintList = appCompatDrawableManager.getTintList(context, i);
        if (tintList == null) {
            return null;
        }
        TintInfo tintInfo = new TintInfo();
        tintInfo.mHasTintList = true;
        tintInfo.mTintList = tintList;
        return tintInfo;
    }

    void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (AutoSizeableTextView.PLATFORM_SUPPORTS_AUTOSIZE) {
            return;
        }
        autoSizeText();
    }

    void setTextSize(int i, float f) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (AutoSizeableTextView.PLATFORM_SUPPORTS_AUTOSIZE || isAutoSizeEnabled()) {
            return;
        }
        setTextSizeInternal(i, f);
    }

    void autoSizeText() {
        this.mAutoSizeTextHelper.autoSizeText();
    }

    boolean isAutoSizeEnabled() {
        return this.mAutoSizeTextHelper.isAutoSizeEnabled();
    }

    private void setTextSizeInternal(int i, float f) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        this.mAutoSizeTextHelper.setTextSizeInternal(i, f);
    }

    void setAutoSizeTextTypeWithDefaults(int i) throws IllegalArgumentException {
        this.mAutoSizeTextHelper.setAutoSizeTextTypeWithDefaults(i);
    }

    void setAutoSizeTextTypeUniformWithConfiguration(int i, int i2, int i3, int i4) throws IllegalArgumentException {
        this.mAutoSizeTextHelper.setAutoSizeTextTypeUniformWithConfiguration(i, i2, i3, i4);
    }

    void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i) throws IllegalArgumentException {
        this.mAutoSizeTextHelper.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i);
    }

    int getAutoSizeTextType() {
        return this.mAutoSizeTextHelper.getAutoSizeTextType();
    }

    int getAutoSizeStepGranularity() {
        return this.mAutoSizeTextHelper.getAutoSizeStepGranularity();
    }

    int getAutoSizeMinTextSize() {
        return this.mAutoSizeTextHelper.getAutoSizeMinTextSize();
    }

    int getAutoSizeMaxTextSize() {
        return this.mAutoSizeTextHelper.getAutoSizeMaxTextSize();
    }

    int[] getAutoSizeTextAvailableSizes() {
        return this.mAutoSizeTextHelper.getAutoSizeTextAvailableSizes();
    }

    ColorStateList getCompoundDrawableTintList() {
        TintInfo tintInfo = this.mDrawableTint;
        if (tintInfo != null) {
            return tintInfo.mTintList;
        }
        return null;
    }

    void setCompoundDrawableTintList(ColorStateList colorStateList) {
        if (this.mDrawableTint == null) {
            this.mDrawableTint = new TintInfo();
        }
        this.mDrawableTint.mTintList = colorStateList;
        this.mDrawableTint.mHasTintList = colorStateList != null;
        setCompoundTints();
    }

    PorterDuff.Mode getCompoundDrawableTintMode() {
        TintInfo tintInfo = this.mDrawableTint;
        if (tintInfo != null) {
            return tintInfo.mTintMode;
        }
        return null;
    }

    void setCompoundDrawableTintMode(PorterDuff.Mode mode) {
        if (this.mDrawableTint == null) {
            this.mDrawableTint = new TintInfo();
        }
        this.mDrawableTint.mTintMode = mode;
        this.mDrawableTint.mHasTintMode = mode != null;
        setCompoundTints();
    }

    private void setCompoundTints() {
        TintInfo tintInfo = this.mDrawableTint;
        this.mDrawableLeftTint = tintInfo;
        this.mDrawableTopTint = tintInfo;
        this.mDrawableRightTint = tintInfo;
        this.mDrawableBottomTint = tintInfo;
        this.mDrawableStartTint = tintInfo;
        this.mDrawableEndTint = tintInfo;
    }

    private void setCompoundDrawables(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4, Drawable drawable5, Drawable drawable6) {
        if (Build.VERSION.SDK_INT >= 17 && (drawable5 != null || drawable6 != null)) {
            Drawable[] compoundDrawablesRelative = this.mView.getCompoundDrawablesRelative();
            TextView textView = this.mView;
            if (drawable5 == null) {
                drawable5 = compoundDrawablesRelative[0];
            }
            if (drawable2 == null) {
                drawable2 = compoundDrawablesRelative[1];
            }
            if (drawable6 == null) {
                drawable6 = compoundDrawablesRelative[2];
            }
            if (drawable4 == null) {
                drawable4 = compoundDrawablesRelative[3];
            }
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable5, drawable2, drawable6, drawable4);
            return;
        }
        if (drawable == null && drawable2 == null && drawable3 == null && drawable4 == null) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 17) {
            Drawable[] compoundDrawablesRelative2 = this.mView.getCompoundDrawablesRelative();
            if (compoundDrawablesRelative2[0] != null || compoundDrawablesRelative2[2] != null) {
                TextView textView2 = this.mView;
                Drawable drawable7 = compoundDrawablesRelative2[0];
                if (drawable2 == null) {
                    drawable2 = compoundDrawablesRelative2[1];
                }
                Drawable drawable8 = compoundDrawablesRelative2[2];
                if (drawable4 == null) {
                    drawable4 = compoundDrawablesRelative2[3];
                }
                textView2.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable7, drawable2, drawable8, drawable4);
                return;
            }
        }
        Drawable[] compoundDrawables = this.mView.getCompoundDrawables();
        TextView textView3 = this.mView;
        if (drawable == null) {
            drawable = compoundDrawables[0];
        }
        if (drawable2 == null) {
            drawable2 = compoundDrawables[1];
        }
        if (drawable3 == null) {
            drawable3 = compoundDrawables[2];
        }
        if (drawable4 == null) {
            drawable4 = compoundDrawables[3];
        }
        textView3.setCompoundDrawablesWithIntrinsicBounds(drawable, drawable2, drawable3, drawable4);
    }
}
