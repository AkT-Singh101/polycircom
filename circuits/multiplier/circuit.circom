pragma circom 2.0.0;

template LogicOpsCircuit () {  

   signal input Input1;
   signal input Input2;

   signal AndResult;
   signal NotResult;

   signal output FinalResult;

   component AndGate = AndLogic();
   component NotGate = NotLogic();
   component OrGate = OrLogic();

   AndGate.in1 <== Input1;
   AndGate.in2 <== Input2;
   AndResult <== AndGate.out;

   NotGate.in <== Input2;
   NotResult <== NotGate.out;

   OrGate.in1 <== AndResult;
   OrGate.in2 <== NotResult;
   FinalResult <== OrGate.out;
}

template AndLogic() {
    signal input in1;
    signal input in2;
    signal output out;

    out <== in1 * in2;
}

template OrLogic() {
    signal input in1;
    signal input in2;
    signal output out;

    out <== in1 + in2 - in1 * in2;
}

template NotLogic() {
    signal input in;
    signal output out;

    out <== 1 + in - 2 * in;
}

component main = LogicOpsCircuit();
