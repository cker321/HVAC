package me.yokeyword.fragmentation.anim;

import android.os.Parcel;
import android.os.Parcelable;
import me.yokeyword.fragmentation.C0766R;

/* loaded from: classes.dex */
public class DefaultHorizontalAnimator extends FragmentAnimator implements Parcelable {
    public static final Parcelable.Creator<DefaultHorizontalAnimator> CREATOR = new Parcelable.Creator<DefaultHorizontalAnimator>() { // from class: me.yokeyword.fragmentation.anim.DefaultHorizontalAnimator.1
        @Override // android.os.Parcelable.Creator
        public DefaultHorizontalAnimator createFromParcel(Parcel parcel) {
            return new DefaultHorizontalAnimator(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public DefaultHorizontalAnimator[] newArray(int i) {
            return new DefaultHorizontalAnimator[i];
        }
    };

    @Override // me.yokeyword.fragmentation.anim.FragmentAnimator, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public DefaultHorizontalAnimator() {
        this.enter = C0766R.anim.h_fragment_enter;
        this.exit = C0766R.anim.h_fragment_exit;
        this.popEnter = C0766R.anim.h_fragment_pop_enter;
        this.popExit = C0766R.anim.h_fragment_pop_exit;
    }

    protected DefaultHorizontalAnimator(Parcel parcel) {
        super(parcel);
    }

    @Override // me.yokeyword.fragmentation.anim.FragmentAnimator, android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
    }
}
