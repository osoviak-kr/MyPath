#include "libmx.h"

int mx_binary_search(char **arr, int size, const char *s, int *count) {
    *count = 0;
    int mid = size / 2;
    int left = 0;
    int right = size - 1;

    if (!s || !arr)
        return -1;
    while (left <= right) {
        ++*count;
        mid = left + (right - left) / 2;
        if (mx_strcmp(arr[mid], s) == 0)
            return mid;
        else if (mx_strcmp(arr[mid], s) < 0)
            left = mid + 1;
        else if (mx_strcmp(arr[mid], s) > 0)
            right = mid - 1;
    }
    *count = 0;
    mid = -1;
    return mid;
}

