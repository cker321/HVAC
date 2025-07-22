.class public Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
.super Ljava/lang/Object;
.source "OptionsPickerBuilder.java"


# instance fields
.field private mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bigkoo/pickerview/listener/OnOptionsSelectListener;)V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/bigkoo/pickerview/configure/PickerOptions;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/bigkoo/pickerview/configure/PickerOptions;-><init>(I)V

    iput-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    .line 27
    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->context:Landroid/content/Context;

    .line 28
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->optionsSelectListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectListener;

    return-void
.end method


# virtual methods
.method public build()Lcom/bigkoo/pickerview/view/OptionsPickerView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/bigkoo/pickerview/view/OptionsPickerView<",
            "TT;>;"
        }
    .end annotation

    .line 248
    new-instance v0, Lcom/bigkoo/pickerview/view/OptionsPickerView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    invoke-direct {v0, v1}, Lcom/bigkoo/pickerview/view/OptionsPickerView;-><init>(Lcom/bigkoo/pickerview/configure/PickerOptions;)V

    return-object v0
.end method

.method public isCenterLabel(Z)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->isCenterLabel:Z

    return-object p0
.end method

.method public isDialog(Z)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->isDialog:Z

    return-object p0
.end method

.method public isRestoreItem(Z)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->isRestoreItem:Z

    return-object p0
.end method

.method public setBackgroundId(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->backgroundId:I

    return-object p0
.end method

.method public setBgColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->bgColorWheel:I

    return-object p0
.end method

.method public setCancelColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textColorCancel:I

    return-object p0
.end method

.method public setCancelText(Ljava/lang/String;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textContentCancel:Ljava/lang/String;

    return-object p0
.end method

.method public setContentTextSize(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textSizeContent:I

    return-object p0
.end method

.method public setCyclic(ZZZ)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->cyclic1:Z

    .line 191
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->cyclic2:Z

    .line 192
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p3, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->cyclic3:Z

    return-object p0
.end method

.method public setDecorView(Landroid/view/ViewGroup;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->decorView:Landroid/view/ViewGroup;

    return-object p0
.end method

.method public setDividerColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->dividerColor:I

    return-object p0
.end method

.method public setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    return-object p0
.end method

.method public setLabels(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->label1:Ljava/lang/String;

    .line 129
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->label2:Ljava/lang/String;

    .line 130
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p3, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->label3:Ljava/lang/String;

    return-object p0
.end method

.method public setLayoutRes(ILcom/bigkoo/pickerview/listener/CustomListener;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->layoutRes:I

    .line 87
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->customListener:Lcom/bigkoo/pickerview/listener/CustomListener;

    return-object p0
.end method

.method public setLineSpacingMultiplier(F)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->lineSpacingMultiplier:F

    return-object p0
.end method

.method public setOptionsSelectChangeListener(Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->optionsSelectChangeListener:Lcom/bigkoo/pickerview/listener/OnOptionsSelectChangeListener;

    return-object p0
.end method

.method public setOutSideCancelable(Z)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-boolean p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->cancelable:Z

    return-object p0
.end method

.method public setSelectOptions(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->option1:I

    return-object p0
.end method

.method public setSelectOptions(II)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->option1:I

    .line 203
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->option2:I

    return-object p0
.end method

.method public setSelectOptions(III)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->option1:I

    .line 209
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->option2:I

    .line 210
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p3, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->option3:I

    return-object p0
.end method

.method public setSubCalSize(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textSizeSubmitCancel:I

    return-object p0
.end method

.method public setSubmitColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textColorConfirm:I

    return-object p0
.end method

.method public setSubmitText(Ljava/lang/String;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textContentConfirm:Ljava/lang/String;

    return-object p0
.end method

.method public setTextColorCenter(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textColorCenter:I

    return-object p0
.end method

.method public setTextColorOut(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textColorOut:I

    return-object p0
.end method

.method public setTextXOffset(III)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->x_offset_one:I

    .line 216
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p2, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->x_offset_two:I

    .line 217
    iget-object p1, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p3, p1, Lcom/bigkoo/pickerview/configure/PickerOptions;->x_offset_three:I

    return-object p0
.end method

.method public setTitleBgColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->bgColorTitle:I

    return-object p0
.end method

.method public setTitleColor(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textColorTitle:I

    return-object p0
.end method

.method public setTitleSize(I)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textSizeTitle:I

    return-object p0
.end method

.method public setTitleText(Ljava/lang/String;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->textContentTitle:Ljava/lang/String;

    return-object p0
.end method

.method public setTypeface(Landroid/graphics/Typeface;)Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/bigkoo/pickerview/builder/OptionsPickerBuilder;->mPickerOptions:Lcom/bigkoo/pickerview/configure/PickerOptions;

    iput-object p1, v0, Lcom/bigkoo/pickerview/configure/PickerOptions;->font:Landroid/graphics/Typeface;

    return-object p0
.end method
