Object *Parser::getObj(Object *obj, Guchar *fileKey,
CryptAlgorithm encAlgorithm, int keyLength,
int objNum, int objGen, int recursion) {
        ...
        // array
        if (!simpleOnly && recursion < recursionLimit && buf1.isCmd("[")) {
        ...
