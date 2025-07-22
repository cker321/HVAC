.class Lcom/landleaf/smarthome/db/converter/DeviceConverter$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "DeviceConverter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToEntityProperty(Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Ljava/util/List<",
        "Lcom/landleaf/smarthome/model/DeviceModel;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/landleaf/smarthome/db/converter/DeviceConverter;


# direct methods
.method constructor <init>(Lcom/landleaf/smarthome/db/converter/DeviceConverter;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/landleaf/smarthome/db/converter/DeviceConverter$1;->this$0:Lcom/landleaf/smarthome/db/converter/DeviceConverter;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
