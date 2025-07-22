package me.yokeyword.fragmentation.anim;

import android.os.Parcel;
import android.os.Parcelable;
import me.yokeyword.fragmentation.C0766R;

/* loaded from: classes.dex */
public class DefaultVerticalAnimator extends FragmentAnimator implements Parcelable {
    public static final Parcelable.Creator<DefaultVerticalAnimator> CREATOR = new Parcelable.Creator<DefaultVerticalAnimator>() { // from class: me.yokeyword.fragmentation.anim.DefaultVerticalAnimator.1
        @Override // android.os.Parcelable.Creator
        public DefaultVerticalAnimator createFromParcel(Parcel parcel) {
            return new DefaultVerticalAnimator(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public DefaultVerticalAnimator[] newArray(int i) {
            return new DefaultVerticalAnimator[i];
        }
    };

    @Override // me.yokeyword.fragmentation.anim.FragmentAnimator, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public DefaultVerticalAnimator() {
        this.enter = C0766R.anim.v_fragment_enter;
        this.exit = C0766R.anim.v_fragment_exit;
        this.popEnter = C0766R.anim.v_fragment_pop_enter;
        this.popExit = C0766R.anim.v_fragment_pop_exit;
    }

    protected DefaultVerticalAnimator(Parcel parcel) {
        super(parcel);
    }

    @Override // me.yokeyword.fragmentation.anim.FragmentAnimator, android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
    }
}
