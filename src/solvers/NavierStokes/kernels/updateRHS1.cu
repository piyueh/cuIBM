/*
*  Copyright (C) 2012 by Anush Krishnan, Simon Layton, Lorena Barba
*
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the "Software"), to deal
*  in the Software without restriction, including without limitation the rights
*  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*  copies of the Software, and to permit persons to whom the Software is
*  furnished to do so, subject to the following conditions:
*
*  The above copyright notice and this permission notice shall be included in
*  all copies or substantial portions of the Software.
*
*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*  THE SOFTWARE.
*/

#include <solvers/NavierStokes/kernels/updateRHS1.h>

#define BSZ 16

namespace kernels
{

// 1-d interpolation
/*__global__
void updateRHS1(real *rhs1, int numUV, int *tags)
{
	int	I = blockIdx.x*blockDim.x + threadIdx.x;
	
	if(I>=numUV)
		return;
	
	rhs1[I] = rhs1[I]*(tags[I]==-1);
}*/

// 2-d interpolation
__global__
void updateRHS1(real *rhs1, int numUV, int *tagsX, int *tagsY)
{
	int	I = blockIdx.x*blockDim.x + threadIdx.x;
	
	if(I>=numUV)
		return;
	
	// MODIFY THIS FOR MOVING BODIES
	
	rhs1[I] = rhs1[I]*(tagsX[I]==-1 && tagsY[I]==-1);
}

} // end of namespace kernels
