export MPSMatrixSolveCholesky
@objcwrapper immutable=false MPSMatrixSolveCholesky <: MPSMatrixBinaryKernel

function MPSMatrixSolveCholesky(device, upper, order, numberOfRightHandSides)
    kernel = @objc [MPSMatrixSolveCholesky alloc]::id{MPSMatrixSolveCholesky}
    obj = MPSMatrixSolveCholesky(kernel)
    finalizer(release, obj)
    @objc [obj::id{MPSMatrixSolveCholesky} initWithDevice:device::id{MTLDevice}
                                                upper:upper::Bool
                                                order:order::NSUInteger
                                                numberOfRightHandSides:numberOfRightHandSides::NSUInteger]::id{MPSMatrixSolveCholesky}
    return obj
end

# - (instancetype)initWithDevice:(id<MTLDevice>)device 
#                          upper:(BOOL)upper 
#                          order:(NSUInteger)order 
#         numberOfRightHandSides:(NSUInteger)numberOfRightHandSides;




export encode!

# - (void)encodeToCommandBuffer:(id<MTLCommandBuffer>)commandBuffer 
#                  sourceMatrix:(MPSMatrix *)sourceMatrix 
#           rightHandSideMatrix:(MPSMatrix *)rightHandSideMatrix 
#                solutionMatrix:(MPSMatrix *)solutionMatrix;

function encode!(cmdbuf::MTLCommandBuffer, kernel::MPSMatrixSolveCholesky, sourceMatrix, rightHandSideMatrix, solutionMatrix)
    @objc [kernel::id{MPSMatrixSolveCholesky} encodeToCommandBuffer:cmdbuf::id{MTLCommandBuffer}
                                                      sourceMatrix:sourceMatrix::id{MPSMatrix}
                                                      rightHandSideMatrix:rightHandSideMatrix::id{MPSMatrix}
                                                      solutionMatrix:solutionMatrix::id{MPSMatrix}]::Nothing
end

# export MPSMatrixDecompositionCholesky

# @objcwrapper immutable=false MPSMatrixDecompositionCholesky <: MPSMatrixUnaryKernel

# function MPSMatrixDecompositionCholesky(device, lower, order)
#     kernel = @objc [MPSMatrixDecompositionCholesky alloc]::id{MPSMatrixDecompositionCholesky}
#     obj = MPSMatrixDecompositionCholesky(kernel)
#     finalizer(release, obj)
#     @objc [obj::id{MPSMatrixDecompositionCholesky} initWithDevice:device::id{MTLDevice}
#                                                    lower:lower::Bool
#                                                    order:order::NSUInteger]::id{MPSMatrixDecompositionCholesky}
#     return obj
# end

# function encode!(cmdbuf::MTLCommandBuffer, kernel::MPSMatrixDecompositionCholesky, sourceMatrix, resultMatrix, status)
#     @objc [kernel::id{MPSMatrixDecompositionCholesky} encodeToCommandBuffer:cmdbuf::id{MTLCommandBuffer}
#                                                       sourceMatrix:sourceMatrix::id{MPSMatrix}
#                                                       resultMatrix:resultMatrix::id{MPSMatrix}
#                                                       status:status::id{MTLBuffer}]::Nothing
# end
