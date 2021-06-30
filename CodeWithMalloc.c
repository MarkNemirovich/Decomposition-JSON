#include <stdio.h>  /*для printf()*/
#include <malloc.h> /*для malloc()*/

char example1[] = "{ “obj1”: { “val0”: “test”, “val1” : 1337, “val3” : true, “obj2” : { “val22”: 5 } } }";
char example2[] = "{ “query”: “Виктор Иван”, “count” : 7, “parts” : [123, 9] }";
int level = 0;

char CheckOnInt(char* str)
{
    int i, j;   /*изначально считаем, что у нас число*/
    char numbers[] = "0123456789";
    for (int i = 0; i < sizeof(str); i++)
    {
        if (str[i] == NULL) break;  /* если выделенная память больше, чем наше число*/
        for (int j = 0; j < sizeof(numbers) - 1; j++)
        {
            if (str[i] == numbers[j])   /*нашли нужное число, переходим к следующему символу*/
            {
                break;
            }
            if (j == sizeof(numbers) - 2) /*если все числа перебрали и не совпадает с нашим символом, удаляем его*/
            {
                return 0;
            }
        }
    }
    return 1;
}

void NewWord(char word[], int start, int end)
{
    int i, size;
    size = end - start;
    if (size == 0)
        return;
    char* str = (char*)malloc(sizeof(char) * size + 1);   /*сслыка на адрес 1го байта нового слова. Размер +1 для окончания стркои*/
    for (i = 0; i < size; i++)
    {
        str[i] = word[start + i];
    }
    if (str[0] == NULL)         /*пустые строки, если ничего не записали или 2 пробела или зарезервированные символы идут подряд*/
    {
        free(str);
        return;
    }
    str[end - start] = '\0';    /*добавление знака окончания строки, чтобы не тянулся мусор*/
    if (CheckOnInt(str) == 1)
    {
        printf("Number %5s is at lvl %d\n", str, level);
    }
    free(str);  /*освобождение памяти*/
}

void Decay(char stroka[], int size)
{
    printf("Example was %s\n", stroka);
    int i = 0, start = 0, end = 0;
    for (i; i < size; i++)  /*проход по символам массива (строки)*/
    {
        switch (stroka[i])
        {
        case '{':
        case '[':
            start = i + 1;  /*символы начала нового слова, при этом повышают уровень вложенности*/
            level++;
            break;
        case '}':
        case ']':
            end = i;        /*символы окончания нового слова, при этом понижают уровень вложенности*/
            NewWord(stroka, start, end);
            level--;
            break;
        case ',':
        case ':':
            end = i;        /*символы окончания нового слова*/
            NewWord(stroka, start, end);
            break;
        case ' ':
            if (end < start) /*пробел может закончить слово и начинает новое*/
            {
                end = i;
                NewWord(stroka, start, end);
            }
            start = i + 1;
            break;
        }
    }
}
int main()
{
    Decay(example1, sizeof(example1));
    printf("\n");
    Decay(example2, sizeof(example2));
    while (1)
    {
        ;
    }
    return 0;
}