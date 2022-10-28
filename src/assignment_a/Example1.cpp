#include <cstdint>
typedef __int64_t __int64;
#include "../../target/assignment_a/Example1.h"
#include <cstring>

JNIEXPORT jint JNICALL Java_Example1_intMethodName(JNIEnv *env, jobject obj, jint num) {
    return num * num;
}

JNIEXPORT jboolean JNICALL Java_Example1_booleanMethodName(JNIEnv *env, jobject obj, jboolean b) {
    return !b;
}

JNIEXPORT jstring JNICALL Java_Example1_stringMethodName(JNIEnv *env, jobject obj, jstring string) {
    const char *str = env->GetStringUTFChars(string, 0);
    char cap[128];
    strcpy(cap, str); // if the str is > 128 chars this is ub btw
    env->ReleaseStringUTFChars(string, str);
    return env->NewStringUTF(strupr(cap));
}

JNIEXPORT jint JNICALL Java_Example1_intArrayMethodName(JNIEnv *env, jobject obj, jintArray array) {
    jint sum = 0;
    jsize len = env->GetArrayLength(array);
    jint *body = env->GetIntArrayElements(array, 0);

    for(int i = 0; i < len; i++) {
        sum += ((int32_t*)body)[i];
    }

    env->ReleaseIntArrayElements(array, body, 0);
    return sum;
}