deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BBB_FLASH = 'Power up the <%= TYPE_NAME %> while holding down the small button near the SD slot.
You need to keep it pressed until the blue LEDs start flashing wildly.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'am57xx-evm'
	aliases: [ 'am57xx-evm' ]
	name: 'AM571X EVM'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		BBB_FLASH
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#on-mac-and-linux'

	supportsBlink: true

	yocto:
		machine: 'am57xx-evm'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-krogoth'
		deployArtifact: 'resin-image-flasher-am57xx-evm.resin-sdcard'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
