package me.yokeyword.fragmentation.helper.internal;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import androidx.fragment.app.Fragment;
import me.yokeyword.fragmentation.C0766R;
import me.yokeyword.fragmentation.anim.FragmentAnimator;

/* loaded from: classes.dex */
public final class AnimatorHelper {
    private Context context;
    public Animation enterAnim;
    public Animation exitAnim;
    private FragmentAnimator fragmentAnimator;
    private Animation noneAnim;
    private Animation noneAnimFixed;
    public Animation popEnterAnim;
    public Animation popExitAnim;

    public AnimatorHelper(Context context, FragmentAnimator fragmentAnimator) {
        this.context = context;
        notifyChanged(fragmentAnimator);
    }

    public void notifyChanged(FragmentAnimator fragmentAnimator) {
        this.fragmentAnimator = fragmentAnimator;
        initEnterAnim();
        initExitAnim();
        initPopEnterAnim();
        initPopExitAnim();
    }

    public Animation getNoneAnim() {
        if (this.noneAnim == null) {
            this.noneAnim = AnimationUtils.loadAnimation(this.context, C0766R.anim.no_anim);
        }
        return this.noneAnim;
    }

    public Animation getNoneAnimFixed() {
        if (this.noneAnimFixed == null) {
            this.noneAnimFixed = new Animation() { // from class: me.yokeyword.fragmentation.helper.internal.AnimatorHelper.1
            };
        }
        return this.noneAnimFixed;
    }

    public Animation compatChildFragmentExitAnim(Fragment fragment) {
        if (!(fragment.getTag() != null && fragment.getTag().startsWith("android:switcher:") && fragment.getUserVisibleHint()) && (fragment.getParentFragment() == null || !fragment.getParentFragment().isRemoving() || fragment.isHidden())) {
            return null;
        }
        Animation animation = new Animation() { // from class: me.yokeyword.fragmentation.helper.internal.AnimatorHelper.2
        };
        animation.setDuration(this.exitAnim.getDuration());
        return animation;
    }

    private Animation initEnterAnim() {
        if (this.fragmentAnimator.getEnter() == 0) {
            this.enterAnim = AnimationUtils.loadAnimation(this.context, C0766R.anim.no_anim);
        } else {
            this.enterAnim = AnimationUtils.loadAnimation(this.context, this.fragmentAnimator.getEnter());
        }
        return this.enterAnim;
    }

    private Animation initExitAnim() {
        if (this.fragmentAnimator.getExit() == 0) {
            this.exitAnim = AnimationUtils.loadAnimation(this.context, C0766R.anim.no_anim);
        } else {
            this.exitAnim = AnimationUtils.loadAnimation(this.context, this.fragmentAnimator.getExit());
        }
        return this.exitAnim;
    }

    private Animation initPopEnterAnim() {
        if (this.fragmentAnimator.getPopEnter() == 0) {
            this.popEnterAnim = AnimationUtils.loadAnimation(this.context, C0766R.anim.no_anim);
        } else {
            this.popEnterAnim = AnimationUtils.loadAnimation(this.context, this.fragmentAnimator.getPopEnter());
        }
        return this.popEnterAnim;
    }

    private Animation initPopExitAnim() {
        if (this.fragmentAnimator.getPopExit() == 0) {
            this.popExitAnim = AnimationUtils.loadAnimation(this.context, C0766R.anim.no_anim);
        } else {
            this.popExitAnim = AnimationUtils.loadAnimation(this.context, this.fragmentAnimator.getPopExit());
        }
        return this.popExitAnim;
    }
}
