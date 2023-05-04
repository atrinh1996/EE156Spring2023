# Intro
We'll first briefly talk about noise. 

Unintended noise can affect quantum states and has to be taken into consideration with quantum computing. 

It's very context-dependent, so can change by the day and location, and doesn't really scale between small and large quantum computers since they are completely different quantum systems. 

So getting precise and realistic noise models wouldn't be feasible for most users of a QC. 

Researchers do their best to study noise and come up with models that give good noise estimates to identify resulting errors.

# Noises in Quantum Runs
Here are some common unexpected noises that can impact quantum computing.

Environment noise may include temperature, radiation, Earth's rotation, the magnetic field, things not very easily controlled. 

Cross-talk, another term for qubit-qubit entanglement, when its not specified, that happens between logical qubits, or logical qubits and ancilla or extra qubits.

Imprecise gate operations because something might not be calibrated correctly can lead to rotations of qubits that we don't want. 


Leakage is something that can occur, actually due to the other kinds of noise. QC assumes theres only 2 states qubits could be in, also called computational subspace, and thats whats measured. There are more states qubits could be in or leak into, and they can also seep back into computational subspace. This creates noise in the output. 



# Effects of Noise
These are the kinds of effects those noises can have. All boils down to imprecise outputs and affecting any QEC techniques applied. 

So thats causing qubits to decohere, lose thier state, or change their states in a way that impacts output measured. 



# Figures 
This is an output from the Regetti service we used to run our experiments. For a simple run

That first histogram shows the probability output from a simulator, which we take as our perfect target from a noiseless run, no errors, 100% certainty our result is [0,0]. And we use this to compare to the second histogram, 

the probability distribution from hardware, we have a 40% distribution of target output. 

The differences are mostly attributed to noise. You may notice, the frequencies don't add up to 1. Sourcing particular noise that cause these errors isn't quite as straightforward; you might think, the missing numbers are probably leakages, but it might also be from unexpected decoherences or unintended state evolutions. 

The QC service we used didn't have what could ideally map to the source of noises or estimate them. This type of insight is usually gleaned from many more runs than what we were able to do, even when re-running with tweaked parameters. 


# Process Fidelity
A metric we were interested in looking at is something called process fidelity, which is how close operations in a noisy system are to those in a noiseless system, the target. 

At the bottom, the target is G, and the actual is G(hat). 

So like how fidelity is classically defined, how close two distributions are to one another. If fidelity is 1, then they are the same distribution, or for quantum, the same systems or same operations. 

Fidelity is defined using the trace of a matrix, the TR, the sum of the diagonal elements. 

We found some simulators will have features that do the matrix operations and provides the process fidelity. 

We try to explain it a little here because fidelty was one of the easier to understand metrics, but didn't find a similar easy to use feature on the QC service we ran on. For times sake, these may be left for future work. 


# Models 
- These are some noise models and detection schemes we thought may be applicable to our initial results. They're described at a higher level, but not implemented. 


- The first one uses a set of gates, pauli and clifford noise channels, and probabilistically insert one into the circuit at random. It's supposed to improve process fidelity and model noise from environment interactions. 

- The second one detects cross-talk. It constructs a quantum noise correlation matrix for qubit-qubit interactions, which visualizes relationships between pairs of qubits and give an estimate of the probability distribution of the average noise in the system. 

-And finally, for leakage detection, we found two separate papers that do similar protocols. It takes repeated measurements and uses a statistical model called the hidden Markov model that assumes there are unobservable states that influence what is observable, and outputs where leakages are detected and those data can be discarded.
