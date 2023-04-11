#ifndef GSHARE_H
#define GSHARE_H


#include <cstring>
#include <iostream>
#include <bitset>
#include <stdlib.h>
// #include "branch_predictor.h"


// class GSharePredictor : public BranchPredictor
class GSharePredictor
{


public:

   
   // GSharePredictor(String name, core_id_t core_id, unsigned int pht_index_bits_, unsigned int ghr_bits_, unsigned int cntr_bits_) : BranchPredictor(name, core_id), pht_index_bits(pht_index_bits_), ghr_bits(ghr_bits_), cntr_bits(cntr_bits_)
   GSharePredictor(char * name, int core_id, unsigned int pht_index_bits, unsigned int ghr_bits, unsigned int cntr_bits)
   {
      
      pht_table_entries = 1 << pht_index_bits;
      PHT_TABLE = new unsigned int[pht_table_entries];
      memset(PHT_TABLE, 0, pht_table_entries * sizeof(*PHT_TABLE));
      num_ghr_bits = ghr_bits;
      num_cntr_bits = cntr_bits;

      
      // **** Loop used for testing. Remove after.
      for (int i = 0; i < 16; i++)
	   PHT_TABLE[i] = i % 4;


      ghr = 0;
      COUNTER_MAX = (1 << num_cntr_bits) - 1;
   };




   ~GSharePredictor()
   {
      delete PHT_TABLE;
   };




   /**
    * Called from the Simulator to predict the result of branch instruction
    * in address 'ip' with target address 'target'.
    *
    * 1 = taken, 0 = not taken
    **/
   // bool predict(IntPtr ip, IntPtr target)
   bool predict(int ip, int target)
   {
      
      // Implement this function


   };





   /**
    * Called from the Simulator to update the internal state of the predictor.
    **/
   void update(bool predicted, bool actual, int ip, int target)
   {

      // Implement this function
	
       
      //updateCounters(predicted, actual);
   
   };
   




   /**
    * Called by the test harness for debugging purposes.
    * Prints index followed by counter value
    **/
   void print()
   {
      
      // Format: 'index':'counter value'      
      
      std::cout << "-------------------------" << std::endl;
      std::cout << "|          PHT          |" << std::endl;
      std::cout << "-------------------------" << std::endl;

      for (unsigned int i = 0; i<pht_table_entries; i++) {
	std::cout << i << ": " << PHT_TABLE[i] << std::endl;
      } 
      std::cout << std::endl;	
   }   





private:
   
   // -----------KEY--------------
   // ghr = global history register
   // pht = pattern history table
   
   unsigned int pht_index_bits, ghr_bits, num_ghr_bits, cntr_bits, num_cntr_bits, ghr;
   unsigned int COUNTER_MAX;
   unsigned int *PHT_TABLE;
   unsigned int pht_table_entries;
};

#endif
