.class public final enum Lorg/greenrobot/greendao/identityscope/IdentityScopeType;
.super Ljava/lang/Enum;
.source "IdentityScopeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/greenrobot/greendao/identityscope/IdentityScopeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

.field public static final enum None:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

.field public static final enum Session:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 19
    new-instance v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    const/4 v1, 0x0

    const-string v2, "Session"

    invoke-direct {v0, v2, v1}, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->Session:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    new-instance v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    const/4 v2, 0x1

    const-string v3, "None"

    invoke-direct {v0, v3, v2}, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->None:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    const/4 v3, 0x2

    new-array v3, v3, [Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    .line 18
    sget-object v4, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->Session:Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    aput-object v4, v3, v1

    aput-object v0, v3, v2

    sput-object v3, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->$VALUES:[Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 18
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/greenrobot/greendao/identityscope/IdentityScopeType;
    .locals 1

    .line 18
    const-class v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    return-object p0
.end method

.method public static values()[Lorg/greenrobot/greendao/identityscope/IdentityScopeType;
    .locals 1

    .line 18
    sget-object v0, Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->$VALUES:[Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    invoke-virtual {v0}, [Lorg/greenrobot/greendao/identityscope/IdentityScopeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/greenrobot/greendao/identityscope/IdentityScopeType;

    return-object v0
.end method
