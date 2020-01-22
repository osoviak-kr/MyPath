#include "pathfinder.h"

static void print_distance(t_main *stct, t_retpath *stack);

void mx_ret_trip_output(t_main *stct, t_retpath *stack) {
    int i = stack->path[1];
    int j = stack->path[0];
    int n = stack->size;

    mx_printstr("========================================");
    mx_printstr("\n");
    mx_printstr("Path: ");
    mx_printstr(stct->arr_v[i]);
    mx_printstr(" -> ");
    mx_printstr(stct->arr_v[j]);
    mx_printstr("\nRoute: ");
    for (int i = 1; i <= n; i++) {
        mx_printstr(stct->arr_v[stack->path[i]]);
        (i < n) ? mx_printstr(" -> ") : mx_printstr("");
    }
    print_distance(stct, stack);
    mx_printstr("\n");
    mx_printstr("========================================\n");
}

static void print_distance(t_main *stct, t_retpath *stack) {
    int sum = 0;
    int n = stack->size;

    mx_printstr("\nDistance: ");
    if (n == 2)
        mx_printint(stct->m_dist[stack->path[n]][stack->path[n - 1]]);
    else {
        for (int i = 1; i < n; i++) {
            mx_int_print(stct->m_dist[stack->path[i]][stack->path[i + 1]]);
            sum += stct->m_dist[stack->path[i]][stack->path[i + 1]];
            (i + 1 < n) ? mx_printstr(" + ") : mx_printstr("");
        }
        mx_printstr(" = ");
        mx_printint(sum);
    }
}
