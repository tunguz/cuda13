// hello_axpy.cu  (C++17 ok with CUDA 13)
#include <cuda_runtime.h>
#include <cstdio>

__global__ void axpy_kernel(int n, float a, const float* x, float* y) {
  // TODO: compute global thread id
  // TODO: grid-stride loop over n
  // TODO: y[i] = a * x[i] + y[i];
}

int main() {
  const int N = 1<<20; const float a = 2.0f;
  float *x, *y, *dx, *dy;
  x = (float*)malloc(N*sizeof(float));
  y = (float*)malloc(N*sizeof(float));
  for (int i=0;i<N;i++){ x[i]=1.0f; y[i]=0.0f; }

  cudaMalloc(&dx, N*sizeof(float));
  cudaMalloc(&dy, N*sizeof(float));
  cudaMemcpy(dx, x, N*sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(dy, y, N*sizeof(float), cudaMemcpyHostToDevice);

  // TODO: choose <<<blocks, threads>>> and launch axpy_kernel

  cudaMemcpy(y, dy, N*sizeof(float), cudaMemcpyDeviceToHost);
  printf("y[0]=%f  y[N-1]=%f\n", y[0], y[N-1]);

  cudaFree(dx); cudaFree(dy);
  free(x); free(y);
}
