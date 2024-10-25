Object *Parser::getObj(Object *obj, Guchar *fileKey,
CryptAlgorithm encAlgorithm, int keyLength,
int objNum, int objGen) {
        ...
        // array
        if (buf1.isCmd("[")) {
        ...
