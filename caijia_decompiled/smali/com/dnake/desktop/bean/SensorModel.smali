.class public Lcom/dnake/desktop/bean/SensorModel;
.super Ljava/lang/Object;
.source "SensorModel.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/dnake/desktop/bean/SensorModel;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_DELAY:I = 0x320


# instance fields
.field private delay:I

.field private floorName:Ljava/lang/String;

.field private isSign:Z

.field private sensorType:Lcom/dnake/desktop/bean/SensorType;

.field private slaveAddress:B

.field private uniteName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 158
    new-instance v0, Lcom/dnake/desktop/bean/SensorModel$1;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/SensorModel$1;-><init>()V

    sput-object v0, Lcom/dnake/desktop/bean/SensorModel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(BLjava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-byte p1, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 28
    iput-object p2, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 150
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/bean/SensorType;->values()[Lcom/dnake/desktop/bean/SensorType;

    move-result-object v1

    aget-object v0, v1, v0

    :goto_0
    iput-object v0, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 151
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    iput-byte v0, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 152
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/dnake/desktop/bean/SensorModel$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1}, Lcom/dnake/desktop/bean/SensorModel;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/bean/SensorType;B)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 33
    iput-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/bean/SensorType;BLjava/lang/String;Z)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 64
    iput-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 65
    iput-object p3, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    .line 66
    iput-boolean p4, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    const/16 p1, 0x320

    .line 67
    iput p1, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/bean/SensorType;BLjava/lang/String;ZI)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 56
    iput-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 57
    iput-object p3, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    .line 58
    iput-boolean p4, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    .line 59
    iput p5, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/bean/SensorType;BLjava/lang/String;ZILjava/lang/String;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 47
    iput-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 48
    iput-object p3, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    .line 49
    iput-boolean p4, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    .line 50
    iput p5, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    .line 51
    iput-object p6, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/dnake/desktop/bean/SensorType;BLjava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    .line 38
    iput-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    .line 39
    iput-object p3, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    .line 40
    iput-boolean p4, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    .line 41
    iput-object p5, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getDelay()I
    .locals 1

    .line 71
    iget v0, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    if-nez v0, :cond_0

    const/16 v0, 0x320

    .line 72
    iput v0, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    .line 73
    :cond_0
    iget v0, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    return v0
.end method

.method public getFloorName()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    return-object v0
.end method

.method public getSensorType()Lcom/dnake/desktop/bean/SensorType;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    return-object v0
.end method

.method public getSlaveAddress()B
    .locals 1

    .line 106
    iget-byte v0, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    return v0
.end method

.method public getUniteName()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    return-object v0
.end method

.method public isSign()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    return v0
.end method

.method public setDelay(I)V
    .locals 0

    .line 86
    iput p1, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    return-void
.end method

.method public setFloorName(Ljava/lang/String;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    return-void
.end method

.method public setSensorType(Lcom/dnake/desktop/bean/SensorType;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    return-void
.end method

.method public setSign(Z)V
    .locals 0

    .line 94
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    return-void
.end method

.method public setSlaveAddress(B)V
    .locals 0

    .line 110
    iput-byte p1, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    return-void
.end method

.method public setUniteName(Ljava/lang/String;)V
    .locals 0

    .line 118
    iput-object p1, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SensorModel{sensorType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", slaveAddress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-byte v1, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", uniteName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", isSign="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", delay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 140
    iget-object p2, p0, Lcom/dnake/desktop/bean/SensorModel;->sensorType:Lcom/dnake/desktop/bean/SensorType;

    if-nez p2, :cond_0

    const/4 p2, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/dnake/desktop/bean/SensorType;->ordinal()I

    move-result p2

    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    iget-byte p2, p0, Lcom/dnake/desktop/bean/SensorModel;->slaveAddress:B

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 142
    iget-object p2, p0, Lcom/dnake/desktop/bean/SensorModel;->uniteName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 143
    iget-boolean p2, p0, Lcom/dnake/desktop/bean/SensorModel;->isSign:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 144
    iget p2, p0, Lcom/dnake/desktop/bean/SensorModel;->delay:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 145
    iget-object p2, p0, Lcom/dnake/desktop/bean/SensorModel;->floorName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
