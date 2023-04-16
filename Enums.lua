--[[ Enums --]]

AimMode = {	None = 0, ADS = 1, ZoomedZoom = 2, Zoomed = 3, ZoomedFar = 4 }
AnimationSlotType = { FullBody = 0, UpperBody = 1 }
AssetType = { Map = 2, StaticMesh = 4, SkeletalMesh = 8, Sound = 16, Animation = 32, Particle = 64, Material = 128, Other = 256, Blueprint = 512 }
AttachmentRule = { KeepRelative = 0, KeepWorld = 1, SnapToTarget = 2 }
AttenuationFunction = { Linear = 0, Logarithmic = 1, Inverse = 2, LogReverse = 3, NaturalSound = 4 }
BlendMode = { Opaque = 0, Masked = 1, Translucent = 2, Additive = 3, Modulate = 4, MaskedDistanceField = 5, MaskedDistanceFieldShadowed = 6, TranslucentDistanceField = 7, TranslucentDistanceFieldShadowed = 8, AlphaComposite = 9, AlphaHoldout = 10, AlphaBlend = 11, TranslucentAlphaOnly = 12, TranslucentAlphaOnlyWriteAlpha = 13 }
CameraMode = { FPSTPS = 0, FPSOnly = 1, TPSOnly = 2 }
CCDMode = { Auto = 0, Disabled = 1, Enabled = 2 }
GrabMode = { Disabled = 0, Auto = 1, Enabled = 2 }
CollisionChannel = { WorldStatic = 1 << 0, WorldDynamic = 1 << 1, Pawn = 1 << 2, PhysicsBody = 1 << 5, Vehicle = 1 << 22, TracePrimitive = 1 << 16, Mesh = 1 << 17, Foliage = 1 << 20 , Water = 1 << 19 }
CollisionType = { Normal = 0, StaticOnly = 1, NoCollision = 2, IgnoreOnlyPawn = 3, Auto = 4 }
ConstraintMotion = { Free = 0, Limited = 1, Locked = 2 }
CursorType = { None = 0, Default = 1, TextEditBeam = 2, ResizeLeftRight = 3, ResizeUpDown = 4, ResizeSouthEast = 5, ResizeSouthWest = 6, CardinalCross = 7, Crosshairs = 8, Hand = 9, GrabHand = 10, GrabHandClosed = 11, SlashedCircle = 12, EyeDropper = 13 }
DatabaseEngine = { SQLite = 0, MySQL = 1, PostgreSQL = 2 }
DamageType = { Shot = 0, Explosion = 1, Punch = 2, Fall = 3, RunOverProp = 4, RunOverVehicle = 5, Melee = 6, Unknown = 7 }
FallingMode = { None = 0, Jumping = 1, Climbing = 2, Vaulting = 3, Falling = 4, HighFalling = 5, Parachuting = 6, SkyDiving = 7 }
FontType = { Roboto = 0, GothicA1 = 1, PoiretOne = 2, Oswald = 3, Roboto_Mono = 4, OpenSans = 5 }
GaitMode = { None = 0, Walking = 1, Sprinting = 2 }
HandlingMode = { SingleHandedWeapon = 0, DoubleHandedWeapon = 1, SingleHandedMelee = 2, DoubleHandedMelee = 3, Throwable = 4, Torch = 5, Barrel = 6, Box = 7 }
HighlightMode = { Always = 0, OnlyHidden = 1, OnlyVisible = 2 }
InputEvent = { Pressed = 0, Released = 1 }
KeyModifier = { None = 0, LeftShiftDown = 1 << 0, RightShiftDown = 1 << 1, LeftControlDown = 1 << 2, RightControlDown = 1 << 3, LeftAltDown = 1 << 4, RightAltDown = 1 << 5, LeftCommandDown = 1 << 6, RightCommandDown = 1 << 7, CapsLocked = 1 << 8 }
LightType = { Point = 0, Spot = 1, React = 2 }
LightProfile = { None = 0, Arrow_Star = 1, Arrow_Up = 2, Beam_01 = 3, Beam_02 = 4, Beam_03 = 5, Beam_04 = 6, Beam_05 = 7, Beam_06 = 8, Beam_07 = 9, Beam_08 = 10, Beam_LED_01 = 11, Beam_LED_02 = 12, Beam_LED_03 = 13, Beam_LED_04 = 14, Beam_LED_05 = 15, Beam_LED_06 = 16, Beam_LED_07 = 17, Bow = 18, Capped_01 = 19, Capped_02 = 20, Shattered_01 = 21, Shattered_02 = 22, Shattered_03 = 23, Shattered_04 = 24, Shattered_05 = 25, SpotLight_01 = 26, SpotLight_02 = 27, SpotLight_03 = 28, SpotLight_04 = 29, Spreadout_01 = 30, Spreadout_02 = 31, Spreadout_03 = 32, Spreadout_04 = 33, Star_Bow = 34, Star_Burst_01 = 35, Star_Burst_02 = 36, Star_Burst_03 = 37, Star_Burst_04 = 38, Star_Burst_05 = 39, Star_Burst_06 = 40, Star_Burst_07 = 41, Star_Burst_08 = 42, Star_X_01 = 43, Star_X_02 = 44, Wall_Boomerang = 45, Wall_Inverted_V = 46, Wall_Star_T = 47, Wing_6 = 48, Wing_V_01 = 49, Wing_V_02 = 50 }
LogType = { Display = 0, Warning = 1, Error = 2, Debug = 3, Verbose = 4, Scripting = 5, ScriptingWarn = 6, ScriptingError = 7, Chat = 8, WebUI = 9, Success = 10, Fatal = 11 }
SoundType = { SFX = 0, Music = 1, UI = 2 }
SoundLoopMode = { Default = 0, Forever = 1, Never = 2 }
StanceMode = { None = 0, Standing = 1, Crouching = 2, Proning = 3 }
SurfaceType = { Default = 0, Carpet = 1, Concrete = 2, Grass = 3, Gravel = 4, Ground = 5, MetalLight = 6, Plastic = 7, Sand = 8, Snow = 9, Water = 10, WoodLight = 11, Flesh = 12, MetalHeavy = 13, WoodHeavy = 14, Ice = 15, Mud = 16, Rock = 17, Thump = 18, Glass = 19, Rubber = 20, Air = 21 }
SwimmingMode = { None = 0, Surface = 1, Underwater = 2 }
TextRenderAlignCamera = { Unaligned = 0, AlignCameraRotation = 1, FaceCamera = 2 }
TextRenderBevelType = { Linear = 0, HalfCircle = 1, Convex = 2, Concave = 3, OneStep = 4, TwoSteps = 5, Engraved = 6 }
TextRenderHorizontalAlignment = { Left = 0, Center = 1, Right = 2 }
TextRenderVerticalAlignment = { FirstLine = 0, Top = 1, Center = 2, Bottom = 3 }
TraceMode = { DrawDebug = 1 << 0, TraceComplex = 1 << 1, ReturnPhysicalMaterial = 1 << 2, ReturnEntity = 1 << 3, ReturnNames = 1 << 4, ReturnUV = 1 << 5 }
TriggerType = { Sphere = 0, Box = 1 }
ViewMode = { FPS = 0, TPS1 = 1, TPS2 = 2, TPS3 = 3, TopDown = 4 }
VOIPSetting = { Local = 0, Global = 1, Muted = 2 }
WeatherType = { ClearSkies = 1, Cloudy = 2, Foggy = 3, Overcast = 4, PartlyCloudy = 5, Rain = 6, RainLight = 7, RainThunderstorm = 8, SandDustCalm = 9, SandDustStorm = 10, Snow = 11, SnowBlizzard = 12, SnowLight = 13 }
WebUIModifier = { None = 0, CapsLockOn = 1 << 0, ShiftDown = 1 << 1, ControlDown = 1 << 2, AltDown = 1 << 3, LeftMouseButton = 1 << 4, MiddleMouseButton = 1 << 5, RightMouseButton = 1 << 6, CommandDown = 1 << 7, NumLockOn = 1 << 8, IsKeyPad = 1 << 9, IsLeft = 1 << 10, IsRight = 1 << 11, AltgrDown = 1 << 12, IsRepeat = 1 << 13 }
WebUIMouseType = { Left = 0, Right = 1, Middle = 2 }
WebUIKeyType = { Down = 0, Up = 1, Char = 2 }
