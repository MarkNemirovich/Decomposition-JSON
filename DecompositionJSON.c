﻿#include <stdio.h>  /*для printf()*/
#include <malloc.h> /*для malloc()*/
#pragma warning(disable : 4996) /*компилятор с++ считает функцию fopen устаревшей*/

#define TRUE 1;
#define FALSE 0;

char example[] = R"({ "obj1": { "Msg1": "First example : 20, 3]", "val1" : 1337, "val3" : true, "obj2" : { "val22": 5 } } })";
int level = 0;

int Pow(int times)
{
    int res = 1;
    while (times > 1) /*считаем порядки от максимального до единиц*/
    {
        res *= 10;
        times--;
    }
    return res;
}

int CharToInt(char* word, int start, int end)
{
    int i, size, res = 0;
    size = end - start;
    for (i = 0; i < size; i++)
    {
        res += (word[start + i] - '0') * Pow(size - i);
    }
    return res;
}

void Parse(char* allText, int size)
{
    int i = 0, start = 0, end = 0;
    char flag = 0, integer = 0;
    for (i; i < size; i++)  /*проход по символам массива (строки)*/
    {
        if (flag == 1)  /*в данному случае идет работа со строкой*/
        {
            if (allText[i] == '"')
            {
                flag = FALSE;   /*конец строки*/
            }
            else
            {
                continue;   /*строки не интересуют*/
            }
        }
        else
        {
            switch (allText[i])
            {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                if (integer == 1)
                {
                    continue;   /*идёт продолжение числа*/
                }
                else
                {
                    integer = TRUE; /*обнаружение нового числа*/
                    start = i;
                }
                break;
            case '"':
                flag = 1;   /*начало строки*/
            case '{':
            case '[':
                level++;
            case '}':
            case ']':
                level--;
            default:
                if (integer == 1)   /*число закончилось, пришел другой символ*/
                {
                    int number = CharToInt(allText, start, i);
                    printf("Number %-5d is at lvl %d\n", number, level);    /*на выводе не строка, а целочисленное значение*/
                }
                integer = FALSE;
                break;
            }
        }

    }
}

int main()
{
    printf("Json-obj from RawString (c++) \t%s\n", example);
    Parse(example, sizeof(example));
    printf("\n");

    FILE* fp;
    char c = NULL;
    char* str = NULL;
    int size = 0;
    if ((fp = fopen("test.txt", "r")) == NULL)  /*прверка наличия файла*/
    {
        printf("File don't found\n");
    }
    else
    {
        while ((c = getc(fp)) != EOF)   /*посчитать размер файла*/
        {
            size++;
        }
        rewind(fp); /*вернуться к левому элементу файла*/
        str = (char*)malloc(size + 1);
        if (str && size > 0)    /*проверка на наличие выделенной памяти и не пустой ли был файл*/
        {
            int i = 0;
            while ((c = getc(fp)) != EOF)
            {
                if (i < size)   /*резерв для последнего места в строке для спец. символа*/
                {
                    str[i] = c;
                    i++;
                }
            }
            str[size] = '\0';   /*спец. символ окончания стркои*/
            printf("Json-obj from File \t%s\n", str);
            Parse(str, size);
        }
        fclose(fp);
    }
    free(str);
    return 0;
}