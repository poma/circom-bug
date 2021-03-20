include "../node_modules/circomlib/circuits/bitify.circom";
include "../node_modules/circomlib/circuits/sha256/sha256.circom";

template Test() {
    signal output out;
    component hasher = Sha256(8);
    var index = 0;
    for (var i = 0; i < 8; i++) {
      hasher.in[index++] <== i % 2;
    }
    log(index);

    component b2n = Bits2Num(256);
    for (var i = 0; i < 256; i++) {
        b2n.in[i] <== hasher.out[i];
    }
    out <== b2n.out;
}

component main = Test();