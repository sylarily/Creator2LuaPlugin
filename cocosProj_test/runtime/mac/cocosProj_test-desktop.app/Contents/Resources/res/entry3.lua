return {
	children={
	[1]={
		id=4,name="Root",active=true,
		size={width=960,height=640,},anchor={x=0.5,y=0.5,},position={x=480,y=320,},
		scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
		opacity=255,color={r=255,g=255,b=255,},
		children={
		[1]={
			id=5,name="Particle",active=true,
			size={width=0,height=0,},anchor={x=0.5,y=0.5,},position={x=0,y=0,},
			scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
			opacity=255,color={r=255,g=255,b=255,},
			components={
			[1]={
				id=6,type="cc.ParticleSystem",
				enabled=true,
				srcBlendFactor=770,
				dstBlendFactor=1,
				playOnLoad=true,
				autoRemoveOnFinish=false,
				custom=true,
				file="effect/particleTexture/fangkuai.plist",
				spriteFrame={
					type="sprite-frame",
					texture="effect/particleTexture/fangkuai.png",
					uri="fangkuai.png/fangkuai",
					rect={x=0,y=0,width=64,height=64,},
					offset={x=0,y=0,},
					originalSize={width=64,height=64,},
					capInsets=nil,
					rotated=nil,
				},
			}
			},
		},
		[2]={
			id=7,name="Mask",active=true,
			size={width=40,height=40,},anchor={x=0.5,y=0.5,},position={x=144,y=0,},
			scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
			opacity=255,color={r=255,g=255,b=255,},
			components={
			[1]={
				id=10,type="cc.Mask",
				enabled=true,
				modeType=2,
				inverted=true,
				segements=64,
				spriteFrame={
					type="sprite-frame",
					texture="resources/icon.png",
					uri="icon.png/icon",
					rect={x=0,y=0,width=195,height=270,},
					offset={x=0,y=0,},
					originalSize={width=195,height=270,},
					capInsets=nil,
					rotated=nil,
				},
				alphaThreshold=0.7,
			}
			},
			children={
			[1]={
				id=8,name="Sprite",active=true,
				size={width=92,height=86,},anchor={x=0.5,y=0.5,},position={x=0,y=0,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=255,g=255,b=255,},
				components={
				[1]={
					id=9,type="cc.Sprite",
					enabled=true,
					renderType=0,
					sizeMode=1,
					fillType=0,
					fillCenter={x=0,y=0,},
					fillStart=0,
					fillRange=0,
					trimmedMode=true,
					srcBlend=770,
					dstBlend=771,
					spriteFrame={
						type="sprite-frame",
						texture="resources/enemies.png",
						uri="enemies.png/damaged-f",
						rect={x=318,y=739,width=92,height=86,},
						offset={x=0,y=0,},
						originalSize={width=92,height=86,},
						capInsets=nil,
						rotated=nil,
					},
				}
				},
			}
			},
		},
		[3]={
			id=11,name="RichText",active=true,
			size={width=216.6419512195122,height=50,},anchor={x=0.5,y=0.5,},position={x=0,y=-84,},
			scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
			opacity=255,color={r=255,g=255,b=255,},
			components={
			[1]={
				id=19,type="cc.RichText",
				enabled=true,
				string="<color=#00ff00>Rich</c><color=#0fffff>Text</color><img src=\"ach0\" />",
				horizontalAlign=0,
				fontSize=40,
				font="bmfonts/smdg.ttf",
				maxWidth=0,
				lineHeight=50,
				imageAtlas={
					type="sprite-atlas",
					spriteFrames={
					[1]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach0",
						rect={x=839,y=901,width=37,height=41,},
						offset={x=0,y=0,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=1,
					},
					[2]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach1",
						rect={x=883,y=857,width=37,height=41,},
						offset={x=0,y=0,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=nil,
					},
					[3]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach2",
						rect={x=916,y=814,width=37,height=41,},
						offset={x=0,y=0,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=nil,
					},
					[4]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach3",
						rect={x=918,y=769,width=41,height=45,},
						offset={x=0,y=1,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=1,
					},
					[5]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach4",
						rect={x=869,y=769,width=47,height=43,},
						offset={x=0,y=2,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=nil,
					},
					[6]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach5",
						rect={x=965,y=769,width=41,height=45,},
						offset={x=0,y=-1,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=1,
					},
					[7]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach6",
						rect={x=869,y=814,width=41,height=45,},
						offset={x=0,y=-1,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=1,
					},
					[8]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach7",
						rect={x=779,y=956,width=41,height=45,},
						offset={x=0,y=-1,},
						originalSize={width=49,height=47,},
						capInsets={x=8,y=13,width=8,height=16,},
						rotated=nil,
					},
					[9]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ani-egg-effect",
						rect={x=271,y=881,width=140,height=139,},
						offset={x=-1,y=3,},
						originalSize={width=200,height=199,},
						capInsets=nil,
						rotated=nil,
					},
					[10]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ani-egg0",
						rect={x=1,y=907,width=112,height=132,},
						offset={x=0,y=0,},
						originalSize={width=120,height=140,},
						capInsets=nil,
						rotated=1,
					},
					[11]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ani-egg1",
						rect={x=413,y=908,width=112,height=132,},
						offset={x=0,y=0,},
						originalSize={width=120,height=140,},
						capInsets=nil,
						rotated=1,
					},
					[12]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ani-egg2",
						rect={x=768,y=258,width=112,height=132,},
						offset={x=0,y=0,},
						originalSize={width=120,height=140,},
						capInsets=nil,
						rotated=nil,
					},
					[13]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-damage",
						rect={x=649,y=188,width=78,height=101,},
						offset={x=0,y=0,},
						originalSize={width=78,height=101,},
						capInsets={x=27,y=19,width=26,height=30,},
						rotated=1,
					},
					[14]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-lose",
						rect={x=121,y=1,width=397,height=104,},
						offset={x=0,y=0,},
						originalSize={width=397,height=104,},
						capInsets=nil,
						rotated=nil,
					},
					[15]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-popbuttons",
						rect={x=769,y=392,width=124,height=63,},
						offset={x=0,y=0,},
						originalSize={width=124,height=63,},
						capInsets=nil,
						rotated=nil,
					},
					[16]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-popup",
						rect={x=452,y=107,width=64,height=64,},
						offset={x=0,y=0,},
						originalSize={width=64,height=64,},
						capInsets={x=21,y=16,width=22,height=24,},
						rotated=nil,
					},
					[17]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-small",
						rect={x=974,y=209,width=49,height=88,},
						offset={x=0,y=0,},
						originalSize={width=49,height=88,},
						capInsets=nil,
						rotated=nil,
					},
					[18]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-title",
						rect={x=304,y=485,width=198,height=104,},
						offset={x=0,y=0,},
						originalSize={width=198,height=104,},
						capInsets=nil,
						rotated=1,
					},
					[19]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-unopen",
						rect={x=275,y=685,width=156,height=194,},
						offset={x=0,y=0,},
						originalSize={width=156,height=194,},
						capInsets=nil,
						rotated=nil,
					},
					[20]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-weapon",
						rect={x=795,y=847,width=42,height=42,},
						offset={x=0,y=0,},
						originalSize={width=42,height=42,},
						capInsets=nil,
						rotated=nil,
					},
					[21]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/bg-win",
						rect={x=97,y=485,width=205,height=195,},
						offset={x=0,y=0,},
						originalSize={width=205,height=203,},
						capInsets=nil,
						rotated=nil,
					},
					[22]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-achievement",
						rect={x=713,y=719,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[23]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-back-p",
						rect={x=716,y=956,width=61,height=61,},
						offset={x=0,y=0,},
						originalSize={width=61,height=61,},
						capInsets=nil,
						rotated=nil,
					},
					[24]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-back",
						rect={x=758,y=535,width=61,height=61,},
						offset={x=0,y=0,},
						originalSize={width=61,height=61,},
						capInsets=nil,
						rotated=nil,
					},
					[25]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-back2",
						rect={x=769,y=457,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[26]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-bgoff-p",
						rect={x=706,y=797,width=78,height=78,},
						offset={x=0,y=0,},
						originalSize={width=78,height=78,},
						capInsets=nil,
						rotated=nil,
					},
					[27]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-bgon-p",
						rect={x=847,y=457,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[28]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-challenge",
						rect={x=871,y=535,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[29]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-empty",
						rect={x=831,y=613,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[30]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-gzh",
						rect={x=909,y=613,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[31]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-home-p",
						rect={x=626,y=604,width=85,height=85,},
						offset={x=0,y=0,},
						originalSize={width=85,height=85,},
						capInsets=nil,
						rotated=nil,
					},
					[32]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-home",
						rect={x=626,y=691,width=85,height=85,},
						offset={x=0,y=0,},
						originalSize={width=85,height=85,},
						capInsets=nil,
						rotated=nil,
					},
					[33]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-home2",
						rect={x=791,y=691,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[34]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-more",
						rect={x=869,y=691,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[35]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-moregame",
						rect={x=947,y=691,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[36]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-no-p",
						rect={x=573,y=304,width=133,height=59,},
						offset={x=0,y=0,},
						originalSize={width=133,height=59,},
						capInsets=nil,
						rotated=1,
					},
					[37]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-no",
						rect={x=752,y=197,width=133,height=59,},
						offset={x=0,y=0,},
						originalSize={width=133,height=59,},
						capInsets=nil,
						rotated=nil,
					},
					[38]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-openegg",
						rect={x=520,y=1,width=270,height=87,},
						offset={x=0,y=0,},
						originalSize={width=270,height=87,},
						capInsets=nil,
						rotated=nil,
					},
					[39]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-pause",
						rect={x=636,y=907,width=78,height=78,},
						offset={x=0,y=0,},
						originalSize={width=94,height=94,},
						capInsets=nil,
						rotated=nil,
					},
					[40]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-play-p",
						rect={x=121,y=107,width=329,height=157,},
						offset={x=0,y=0,},
						originalSize={width=341,height=167,},
						capInsets=nil,
						rotated=nil,
					},
					[41]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-play",
						rect={x=121,y=404,width=255,height=79,},
						offset={x=0,y=0,},
						originalSize={width=341,height=167,},
						capInsets=nil,
						rotated=nil,
					},
					[42]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-rank",
						rect={x=716,y=877,width=77,height=77,},
						offset={x=0,y=0,},
						originalSize={width=77,height=77,},
						capInsets=nil,
						rotated=nil,
					},
					[43]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-resume-p",
						rect={x=887,y=197,width=85,height=85,},
						offset={x=0,y=0,},
						originalSize={width=85,height=85,},
						capInsets=nil,
						rotated=nil,
					},
					[44]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-resume",
						rect={x=882,y=284,width=85,height=85,},
						offset={x=0,y=0,},
						originalSize={width=85,height=85,},
						capInsets=nil,
						rotated=nil,
					},
					[45]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-skill-p",
						rect={x=135,y=860,width=134,height=134,},
						offset={x=0,y=0,},
						originalSize={width=134,height=134,},
						capInsets=nil,
						rotated=nil,
					},
					[46]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-task",
						rect={x=791,y=769,width=76,height=76,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[47]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-weapon-p",
						rect={x=433,y=772,width=134,height=134,},
						offset={x=0,y=0,},
						originalSize={width=134,height=134,},
						capInsets=nil,
						rotated=nil,
					},
					[48]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-weapon",
						rect={x=895,y=371,width=84,height=82,},
						offset={x=0,y=0,},
						originalSize={width=84,height=84,},
						capInsets=nil,
						rotated=1,
					},
					[49]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-x-p",
						rect={x=821,y=535,width=48,height=48,},
						offset={x=0,y=0,},
						originalSize={width=48,height=48,},
						capInsets={x=11,y=11,width=10,height=9,},
						rotated=nil,
					},
					[50]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-x",
						rect={x=972,y=461,width=48,height=48,},
						offset={x=0,y=0,},
						originalSize={width=48,height=48,},
						capInsets=nil,
						rotated=nil,
					},
					[51]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-x2",
						rect={x=949,y=520,width=74,height=74,},
						offset={x=0,y=0,},
						originalSize={width=76,height=76,},
						capInsets=nil,
						rotated=nil,
					},
					[52]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-yes-p",
						rect={x=634,y=402,width=133,height=59,},
						offset={x=0,y=0,},
						originalSize={width=133,height=59,},
						capInsets=nil,
						rotated=nil,
					},
					[53]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/btn-yes",
						rect={x=606,y=463,width=133,height=59,},
						offset={x=0,y=0,},
						originalSize={width=133,height=59,},
						capInsets=nil,
						rotated=nil,
					},
					[54]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/frame-char-light",
						rect={x=97,y=682,width=176,height=176,},
						offset={x=0,y=0,},
						originalSize={width=200,height=200,},
						capInsets=nil,
						rotated=nil,
					},
					[55]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/frame-char",
						rect={x=415,y=304,width=156,height=156,},
						offset={x=0,y=0,},
						originalSize={width=200,height=200,},
						capInsets=nil,
						rotated=nil,
					},
					[56]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/frame-game-char",
						rect={x=634,y=268,width=132,height=132,},
						offset={x=0,y=0,},
						originalSize={width=132,height=132,},
						capInsets=nil,
						rotated=nil,
					},
					[57]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/game-arrow",
						rect={x=1,y=467,width=94,height=438,},
						offset={x=0,y=1,},
						originalSize={width=118,height=498,},
						capInsets=nil,
						rotated=nil,
					},
					[58]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/game-arrow2",
						rect={x=1,y=1,width=118,height=464,},
						offset={x=0,y=4,},
						originalSize={width=118,height=498,},
						capInsets=nil,
						rotated=nil,
					},
					[59]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/game-circle-curr",
						rect={x=922,y=857,width=38,height=38,},
						offset={x=0,y=0,},
						originalSize={width=40,height=40,},
						capInsets=nil,
						rotated=nil,
					},
					[60]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/game-circle-ori",
						rect={x=795,y=891,width=42,height=42,},
						offset={x=0,y=0,},
						originalSize={width=42,height=42,},
						capInsets=nil,
						rotated=nil,
					},
					[61]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/game-circle-ori2",
						rect={x=839,y=857,width=42,height=42,},
						offset={x=0,y=0,},
						originalSize={width=42,height=42,},
						capInsets=nil,
						rotated=nil,
					},
					[62]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/icon-coin",
						rect={x=413,y=881,width=18,height=18,},
						offset={x=0,y=0,},
						originalSize={width=18,height=18,},
						capInsets=nil,
						rotated=nil,
					},
					[63]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/icon-dot",
						rect={x=378,y=469,width=14,height=14,},
						offset={x=0,y=0,},
						originalSize={width=16,height=16,},
						capInsets=nil,
						rotated=nil,
					},
					[64]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/icon-egg",
						rect={x=569,y=778,width=80,height=89,},
						offset={x=0,y=0,},
						originalSize={width=88,height=97,},
						capInsets=nil,
						rotated=nil,
					},
					[65]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/icon-reborn-p",
						rect={x=979,y=370,width=89,height=42,},
						offset={x=0,y=0,},
						originalSize={width=89,height=42,},
						capInsets=nil,
						rotated=1,
					},
					[66]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/icon-reborn",
						rect={x=592,y=907,width=89,height=42,},
						offset={x=0,y=0,},
						originalSize={width=89,height=42,},
						capInsets=nil,
						rotated=1,
					},
					[67]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/mask-weapon",
						rect={x=752,y=604,width=77,height=77,},
						offset={x=0,y=0,},
						originalSize={width=79,height=79,},
						capInsets=nil,
						rotated=nil,
					},
					[68]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-arrow",
						rect={x=925,y=457,width=45,height=61,},
						offset={x=0,y=0,},
						originalSize={width=45,height=61,},
						capInsets=nil,
						rotated=nil,
					},
					[69]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-arrow2",
						rect={x=651,y=778,width=53,height=91,},
						offset={x=0,y=0,},
						originalSize={width=55,height=93,},
						capInsets=nil,
						rotated=nil,
					},
					[70]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-char-bg",
						rect={x=955,y=812,width=40,height=40,},
						offset={x=0,y=0,},
						originalSize={width=40,height=40,},
						capInsets=nil,
						rotated=nil,
					},
					[71]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-levelup",
						rect={x=378,y=404,width=63,height=30,},
						offset={x=0,y=0,},
						originalSize={width=63,height=30,},
						capInsets=nil,
						rotated=1,
					},
					[72]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-lock",
						rect={x=433,y=619,width=151,height=151,},
						offset={x=0,y=0,},
						originalSize={width=155,height=155,},
						capInsets=nil,
						rotated=nil,
					},
					[73]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-star",
						rect={x=606,y=439,width=23,height=22,},
						offset={x=0,y=0,},
						originalSize={width=23,height=22,},
						capInsets=nil,
						rotated=nil,
					},
					[74]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-star2",
						rect={x=135,y=996,width=23,height=22,},
						offset={x=0,y=0,},
						originalSize={width=23,height=22,},
						capInsets=nil,
						rotated=nil,
					},
					[75]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/patt-unlock",
						rect={x=410,y=462,width=155,height=155,},
						offset={x=0,y=0,},
						originalSize={width=155,height=155,},
						capInsets=nil,
						rotated=nil,
					},
					[76]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-boss-coming",
						rect={x=520,y=90,width=235,height=96,},
						offset={x=0,y=0,},
						originalSize={width=235,height=96,},
						capInsets=nil,
						rotated=nil,
					},
					[77]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-clear",
						rect={x=452,y=188,width=195,height=73,},
						offset={x=0,y=0,},
						originalSize={width=217,height=79,},
						capInsets=nil,
						rotated=nil,
					},
					[78]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-combo",
						rect={x=547,y=908,width=93,height=43,},
						offset={x=0,y=0,},
						originalSize={width=93,height=43,},
						capInsets=nil,
						rotated=1,
					},
					[79]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-enemy-turn",
						rect={x=792,y=1,width=218,height=96,},
						offset={x=0,y=0,},
						originalSize={width=218,height=96,},
						capInsets=nil,
						rotated=nil,
					},
					[80]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-fanta-shoot",
						rect={x=452,y=263,width=178,height=39,},
						offset={x=0,y=0,},
						originalSize={width=178,height=39,},
						capInsets=nil,
						rotated=nil,
					},
					[81]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-logo",
						rect={x=121,y=266,width=292,height=136,},
						offset={x=0,y=0,},
						originalSize={width=292,height=136,},
						capInsets=nil,
						rotated=nil,
					},
					[82]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/pic-player-turn",
						rect={x=757,y=99,width=216,height=96,},
						offset={x=0,y=0,},
						originalSize={width=216,height=96,},
						capInsets=nil,
						rotated=nil,
					},
					[83]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/square-d",
						rect={x=569,y=772,width=4,height=4,},
						offset={x=0,y=0,},
						originalSize={width=4,height=4,},
						capInsets=nil,
						rotated=nil,
					},
					[84]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/square-s",
						rect={x=758,y=598,width=4,height=4,},
						offset={x=0,y=0,},
						originalSize={width=4,height=4,},
						capInsets=nil,
						rotated=nil,
					},
					[85]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/square-t",
						rect={x=752,y=188,width=3,height=3,},
						offset={x=0,y=0,},
						originalSize={width=4,height=4,},
						capInsets=nil,
						rotated=nil,
					},
					[86]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/tag-new",
						rect={x=979,y=299,width=69,height=44,},
						offset={x=0,y=0,},
						originalSize={width=69,height=44,},
						capInsets=nil,
						rotated=1,
					},
					[87]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/tag-share",
						rect={x=97,y=860,width=36,height=38,},
						offset={x=0,y=0,},
						originalSize={width=36,height=38,},
						capInsets=nil,
						rotated=nil,
					},
					[88]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-ach",
						rect={x=567,y=462,width=150,height=37,},
						offset={x=0,y=0,},
						originalSize={width=150,height=37,},
						capInsets=nil,
						rotated=1,
					},
					[89]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-close",
						rect={x=606,y=524,width=150,height=38,},
						offset={x=0,y=0,},
						originalSize={width=150,height=38,},
						capInsets=nil,
						rotated=nil,
					},
					[90]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-cwin",
						rect={x=606,y=564,width=150,height=38,},
						offset={x=0,y=0,},
						originalSize={width=150,height=38,},
						capInsets=nil,
						rotated=nil,
					},
					[91]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-pause",
						rect={x=975,y=99,width=108,height=48,},
						offset={x=0,y=0,},
						originalSize={width=108,height=48,},
						capInsets=nil,
						rotated=1,
					},
					[92]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-rank1",
						rect={x=586,y=614,width=150,height=38,},
						offset={x=0,y=0,},
						originalSize={width=150,height=38,},
						capInsets=nil,
						rotated=1,
					},
					[93]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-rank2",
						rect={x=713,y=604,width=113,height=37,},
						offset={x=0,y=0,},
						originalSize={width=113,height=37,},
						capInsets=nil,
						rotated=1,
					},
					[94]={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/title-shop",
						rect={x=569,y=869,width=75,height=36,},
						offset={x=0,y=0,},
						originalSize={width=75,height=36,},
						capInsets=nil,
						rotated=nil,
					}
					},
				},
				handleTouchEvent=true,
			}
			},
			children={
			[1]={
				id=12,name="RICHTEXT_CHILD",active=true,
				size={width=78.79,height=50,},anchor={x=0,y=0,},position={x=-108.3209756097561,y=-25,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=0,g=255,b=0,},
				components={
				[1]={
					id=13,type="cc.Label",
					enabled=true,
					useOriginalSize=true,
					actualFontSize=nil,
					fontSize=40,
					lineHeight=50,
					enableWrapText=true,
					systemFont=false,
					spacingX=0,
					string="Rich",
					halign=0,
					valign=1,
					fontFamily="Arial",
					overflow=0,
					font="bmfonts/smdg.ttf",
				}
				},
			},
			[2]={
				id=14,name="RICHTEXT_CHILD",active=true,
				size={width=92.73,height=50,},anchor={x=0,y=0,},position={x=-29.530975609756098,y=-25,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=15,g=255,b=255,},
				components={
				[1]={
					id=15,type="cc.Label",
					enabled=true,
					useOriginalSize=true,
					actualFontSize=nil,
					fontSize=40,
					lineHeight=50,
					enableWrapText=true,
					systemFont=false,
					spacingX=0,
					string="Text",
					halign=0,
					valign=1,
					fontFamily="Arial",
					overflow=0,
					font="bmfonts/smdg.ttf",
				}
				},
			},
			[3]={
				id=16,name="RICHTEXT_Image_CHILD",active=true,
				size={width=45.12195121951219,height=50,},anchor={x=0,y=0,},position={x=63.199024390243906,y=-25,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=255,g=255,b=255,},
				components={
				[1]={
					id=17,type="cc.Sprite",
					enabled=true,
					renderType=1,
					sizeMode=0,
					fillType=0,
					fillCenter={x=0,y=0,},
					fillStart=0,
					fillRange=0,
					trimmedMode=true,
					srcBlend=770,
					dstBlend=771,
					spriteFrame={
						type="sprite-frame",
						texture="textures/ui-common.png",
						uri="ui-common.png/ach0",
						rect={x=839,y=901,width=37,height=41,},
						offset={x=0,y=0,},
						originalSize={width=49,height=47,},
						capInsets=nil,
						rotated=1,
					},
				}
				},
			},
			[4]={
				id=18,name="child",active=true,
				size={width=0,height=0,},anchor={x=0.5,y=0.5,},position={x=0,y=0,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=255,g=255,b=255,},
			}
			},
		},
		[4]={
			id=20,name="EditBox",active=true,
			size={width=160,height=40,},anchor={x=0.5,y=0.5,},position={x=0,y=0,},
			scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
			opacity=255,color={r=255,g=255,b=255,},
			components={
			[1]={
				id=27,type="cc.EditBox",
				enabled=true,
				useOriginalSize=false,
				string="",
				tabIndex=0,
				backgroundImage={
					type="sprite-frame",
					texture="image/default_editbox_bg.png",
					uri="default_editbox_bg.png/default_editbox_bg",
					rect={x=0,y=0,width=40,height=40,},
					offset={x=0,y=0,},
					originalSize={width=40,height=40,},
					capInsets={x=12,y=12,width=12,height=12,},
					rotated=nil,
				},
				returnType=0,
				inputFlag=5,
				inputMode=6,
				fontSize=20,
				lineHeight=40,
				fontColor={r=255,g=255,b=255,},
				placeholder="Enter text here...",
				placeFontSize=20,
				placeFontColor={r=187,g=187,b=187,},
				maxLength=8,
				stayOnTop=false,
			}
			},
			children={
			[1]={
				id=21,name="BACKGROUND_SPRITE",active=true,
				size={width=160,height=40,},anchor={x=0.5,y=0.5,},position={x=0,y=0,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=255,g=255,b=255,},
				components={
				[1]={
					id=22,type="cc.Sprite",
					enabled=true,
					renderType=1,
					sizeMode=0,
					fillType=0,
					fillCenter={x=0,y=0,},
					fillStart=0,
					fillRange=0,
					trimmedMode=true,
					srcBlend=770,
					dstBlend=771,
					spriteFrame={
						type="sprite-frame",
						texture="image/default_editbox_bg.png",
						uri="default_editbox_bg.png/default_editbox_bg",
						rect={x=0,y=0,width=40,height=40,},
						offset={x=0,y=0,},
						originalSize={width=40,height=40,},
						capInsets={x=12,y=12,width=12,height=12,},
						rotated=nil,
					},
				}
				},
			},
			[2]={
				id=23,name="TEXT_LABEL",active=false,
				size={width=158,height=40,},anchor={x=0,y=1,},position={x=-78,y=20,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=255,g=255,b=255,},
				components={
				[1]={
					id=24,type="cc.Label",
					enabled=true,
					useOriginalSize=true,
					actualFontSize=nil,
					fontSize=20,
					lineHeight=40,
					enableWrapText=false,
					systemFont=true,
					spacingX=0,
					string="",
					halign=0,
					valign=1,
					fontFamily="Arial",
					overflow=1,
					font=nil,
				}
				},
			},
			[3]={
				id=25,name="PLACEHOLDER_LABEL",active=true,
				size={width=158,height=40,},anchor={x=0,y=1,},position={x=-78,y=20,},
				scale={x=1,y=1,},rotationx=0,rotationy=0,skewx=0,skewy=0,
				opacity=255,color={r=187,g=187,b=187,},
				components={
				[1]={
					id=26,type="cc.Label",
					enabled=true,
					useOriginalSize=true,
					actualFontSize=nil,
					fontSize=20,
					lineHeight=40,
					enableWrapText=false,
					systemFont=true,
					spacingX=0,
					string="Enter text here...",
					halign=0,
					valign=1,
					fontFamily="Arial",
					overflow=1,
					font=nil,
				}
				},
			}
			},
		}
		},
	}
	},
}