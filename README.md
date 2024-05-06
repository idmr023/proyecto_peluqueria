First:
	flutter build appbundle
	The result will be saved in [project]/build/app/outputs/bundle/release/app.aab.
Second:
	flutter build apk --split-per-abi
	Results will be saved in:
		[project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
		[project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
		[project]/build/app/outputs/apk/release/app-x86_64-release.apk