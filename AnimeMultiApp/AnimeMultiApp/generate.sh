SWIFT_MODULE_SRC="AnimeMultiApp/Networking/Sources/Networking/"
openapi-generator generate -i "anime.yaml" -g swift5 -o "api-mobile"
rm -r $SWIFT_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC
rm -r "api-mobile"
