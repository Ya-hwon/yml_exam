#include <cstdint>
typedef __int64_t __int64;
#include "../target/Example1.h"
#include <cstring>

JNIEXPORT jint JNICALL Java_Example1_intMethodName(JNIEnv *env, jobject obj, jint num) {
    return num * num;
}

JNIEXPORT jboolean JNICALL Java_Example1_booleanMethodName(JNIEnv *env, jobject obj, jboolean boolean) {
    return !boolean;
}

JNIEXPORT jstring JNICALL Java_Example1_stringMethodName(JNIEnv *env, jobject obj, jstring string) {
    const char *str = env->GetStringUTFChars(string, 0);
    char cap[128];
    strcpy(cap, str);
    env->ReleaseStringUTFChars(string, strupr(cap));
    return env->NewStringUTF(strupr(cap));
}

JNIEXPORT jint JNICALL Java_Example1_intMethodName(JNIEnv *env, jobject obj, jintArray array) {
    int sum = 0;
    jsize len = env->GetArrayLength(array);
    jint *body = env->GetIntArrayElements(array, 0);
    for(int i = 0; i < len; i++) {
        sum += body[i];
    }
    env->ReleaseIntArrayElements(array, body, 0);
    return sum;
}

int main(){}