#include <iostream>
#include <stdlib.h>
#include "gshare.h"


int main() 
{

	// For testing, assume 8-bit addresses
	// Loop through 10 branch instructions
	// Verify predictions and predictor state is correct
	 

	unsigned int pht_index_bits = 4; // Means we will have 2^4 entries in our PHT
        unsigned int ghr_bits = 8;
        unsigned int cntr_bits = 2;
	unsigned int  core_id = 0; // Not relevant for testing but necessary for class
	char name[] = "branch_predictor"; // Not relevant for testing but necessary for class
        GSharePredictor predictor(name, core_id, pht_index_bits, ghr_bits, cntr_bits);
	 
	
	unsigned int PC = 0; // Initialize PC
	unsigned int branch_target = 0; // Initialize branch target agress
	bool prediction = false; // Initialize prediction
	bool actual = false; // Initialize actual branch result
	int branches[10] = {20, 50, 20, 20, 20, 15, 10, 15, 10, 15}; // 8-bit branch target adresses
	int actuals[10] = {0, 1, 1, 1, 1, 1, 0, 1, 0, 0}; // actual branch results
	

	for (int i = 0; i<10; i++) {
		branch_target = branches[i]; // load branch target
		prediction = predictor.predict(PC, branch_target); // predict taken or not taken
		actual = actuals[i]; // load actual branch result
		predictor.update(prediction, actual, PC, branch_target); // update predictor state
		if (actual) // Update PC and make sure PC stays within valid address range
			PC = branch_target;
		else {
			if (PC > 255)
				PC = 0;
			else
				PC += 4;
		}
	} 
	 	

}
