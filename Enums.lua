--[[ Enums --]]

AimMode = {	None = 0, ADS = 1, ZoomedZoom = 2, Zoomed = 3, ZoomedFar = 4 }
AnimationSlotType = { FullBody = 0, UpperBody = 1 }
AttenuationFunction = { Linear = 0, Logarithmic = 1, Inverse = 2, LogReverse = 3, NaturalSound = 4 }
CameraMode = { FPSTPS = 0, FPSOnly = 1, TPSOnly = 2 }
CollisionChannel = { WorldStatic = 1 << 0, WorldDynamic = 1 << 1, Pawn = 1 << 2, PhysicsBody = 1 << 5, Vehicle = 1 << 6, Destructible = 1 << 7, TracePrimitive = 1 << 16, Mesh = 1 << 17, Foliage = 1 << 20 }
CollisionType = { Normal = 0, StaticOnly = 1, NoCollision = 2 }
ConstraintMotion = { Free = 0, Limited = 1, Locked = 2 }
CrosshairType = { None = 0, Regular = 1, Circle = 2, Crossbow = 3, Dot = 4, Holo = 5, Launcher = 6, RegularX = 7, Rocket = 8, SeparatedTriangle = 9, Shotgun = 10, Square = 11, Submachine = 12, Tee = 13, ThreeDots = 14, Triangle = 15, Vee = 16 }
CursorType = { None = 0, Default = 1, TextEditBeam = 2, ResizeLeftRight = 3, ResizeUpDown = 4, ResizeSouthEast = 5, ResizeSouthWest = 6, CardinalCross = 7, Crosshairs = 8, Hand = 9, GrabHand = 10, GrabHandClosed = 11, SlashedCircle = 12, EyeDropper = 13 }
DamageType = { Shot = 0, Explosion = 1, Punch = 2, Fall = 3, RunOver = 4, Unknown = 5 }
DifferentialType = { LimitedSlip_4W = 0, LimitedSlip_FrontDrive = 1, LimitedSlip_RearDrive = 2, Open_4W = 3, Open_FrontDrive = 4, Open_RearDrive = 5 }
FallingMode = { None = 0, Jumping = 1, Climbing = 2, Vaulting = 3, Falling = 4, HighFalling = 5, Parachuting = 6, SkyDiving = 7 }
FontType = { Roboto = 0, GothicA1 = 1, PoiretOne = 2, Oswald = 3, Roboto_Mono = 4 }
GaitMode = { None = 0, Walking = 1, Sprinting = 2 }
HandlingMode = { SingleHandedWeapon = 0, DoubleHandedWeapon = 1, SingleHandedMelee = 2, DoubleHandedMelee = 3, Throwable = 4, Torch = 5, Barrel = 6, Box = 7 }
LightType = { Point = 0, Spot = 1, React = 2 }
LogType = { Display = 0, Warning = 1, Error = 2, Debug = 3, Verbose = 4, Scripting = 5, Chat = 6, WebUI = 7 }
MaterialType = { None = 0, Masked = 1, Translucent = 2, TranslucentDepth = 3 }
SoundType = { SFX = 0, Music = 1 }
StanceMode = { None = 0, Standing = 1, Crouching = 2, Proning = 3 }
SurfaceType = { Default = 0, Carpet = 1, Concrete = 2, Grass = 3, Gravel = 4, Ground = 5, MetalLight = 6, Plastic = 7, Sand = 8, Snow = 9, Water = 10, WoodLight = 11, Flesh = 12, MetalHeavy = 13, WoodHeavy = 14, Ice = 15, Mud = 16, Rock = 17, Thump = 18, Glass = 19 }
SwimmingMode = { None = 0, Superficie = 1, Underwater = 2 }
TextRenderAlignCamera = { Unaligned = 0, AlignCameraRotation = 1, FaceCamera = 2 }
TextRenderBevelType = { Linear = 0, HalfCircle = 1, Convex = 2, Concave = 3, OneStep = 4, TwoSteps = 5, Engraved = 6 }
TextRenderHorizontalAlignment = { Left = 0, Center = 1, Right = 2 }
TextRenderVerticalAlignment = { FirstLine = 0, Top = 1, Center = 2, Bottom = 3 }
TriggerType = { Sphere = 0, Box = 1 }
ViewMode = { FPS = 0, TPS1 = 1, TPS2 = 2, TPS3 = 3 }
VOIPSetting = { Local = 0, Global = 1, Muted = 2 }
WeatherType = { Clear = 0, Rain = 1, Cloudy = 2, Thunderstorm = 3 }
