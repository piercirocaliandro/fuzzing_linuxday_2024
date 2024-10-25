void test(char input[4])
{
        int count = 0;

        if (input[0] == 'c') count++;
        if (input[1] == 'i') count++;
        if (input[2] == 'a') count++;
        if (input[3] == 'o') count++;
        if (count == 4) abort();
}
