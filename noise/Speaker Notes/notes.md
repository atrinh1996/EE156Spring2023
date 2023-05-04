
# Intro
- A quantum system always involves some sort of incoherent processes that disturbs it in some way, desired or undesired. So measuring a system is an example of a desired perturbation, where as noise is generally the undesired disturbances. 

- Therefore, quantum computing results should always take in to consideration the effects of noise. 

- Characterizing specific unwanted noise is complex, in research that can mean separate physical experimentation because noise isn't consistent between individual computers, nor from the day-to-day, nor is it straighforward when QC's scale to larger sizes because it is completely different system from their smaller counterparts; i.e. noise is very context-dependent. So PRECISE and REALISTIC noise models for all situations is not quite feasible for most users. 

- So, noise is often estimated and characterized; quantum runs also apply existing noise models that are better understood in order to correct for errors that result from different kinds of noises. 

- For our experiment so far, what we are trying to do in terms of noise is extrapolate from the results likely sources of noise, describe potential impact, and potential noise models that would likely apply our results. A bit of a stretch goal would be to implement a noise model in our runs and see if they actually improve our output. 


# Common Sources of Noise
- So here are the common sources of unwanted noise that could affect a quantum system. 

- A QS interacting with the environment can lead to decoherence of quantum states

- Cross-talk, sort of another way to refer to entanglement or qubit-qubit interactions, can cause loss of information when those interactions are unexpected. 

- When quantum gates are precisely calibrated correctly, they can still cause qubit rotations and state evolutions, but not the ones a user may want; so this can result in changes to what we want the output to be and also impact the Quantum Error Correction techniques being used on the QC 

- Leakage is something that can happen when qubits leave what is called computational subspace. QC works on the assumption that qubits are encoded in this subspace and so have onle 2 possible states. But more than those two states are possible. Qubits leaking out of computational subspace and even seepaging back into computational subspace is caused by some of these other error sources, and so also influences final output and QEC. 


# Noises in Quantum Runs
- These are what we extrapolated the sources of noise are in our runs, mostly based on some of the literature and our available results. 

- the environment noise, of course, encompases radiation, and the time and the day of Earth's rotation an magnetic field, because no system is perfectly isolated from these noise.

- For cross-talk, we're looking at the number of physical qubits and logical qubits to infer possible interactions between ancilla (extra) qubits that are used to mitigate error and logical qubits used in computation. Its been more difficult to glean if or when undesired entanglement between logical qubits occured based on raw results, but this can probably be extrapolated by correcting for as much error as possible and see where the results land relative to target output. 

- Imprecise Gate operations were difficult to figure out; most of our runs, we assumed they work or were already corrected for by the service we used. 

- And leakage, we didn't find that in the results we got back, but it is more likely leakage happens. We read about a technique for leakage detection though. It takes repeated measurements and uses a statistical model called the hidden Markov model that assumes there are unobservable states that influence what is observable, and outpus where leakages are detected are discarded. 


# Effects of Noise
- This is a look at the results of two kinds of runs

- one is on a simulater and we use this as our target output to compare the output from the hardware to. 

- On the simulator, we have this resulting with 100% certainty
- while on the regetti, we get the target about 40% of the distribution

- The differences from target can be attributed to the noise that goes on in the quantum system. 

- Due to the kinds results and data available from the quantum computing service we used, it wasn't possible to source the kinds of noises right away without many more runs with tweaked parameters. 

- One thing we were able to do were runs with a single changing gate, and getting variances in distribution that hits the target output. But due to things like environmental noise, this method requires running these jobs multiple more times across different times of day and times of year. 


# Process Fidelity
Some simulators have methods for giving the process fidelity right away. We couldn’t find a similar feature with the services we were able to use by this point in time, but want to discuss how it is found. 
The classical definition of fidelity is the distance between two probability distributions. When Fidelity F(.) = 1, distributions are identical. 
In quantum, process fidelity can be thought of as how close operations in a noisy system are in relation to those is a noiseless system or our “target”

rho here is how quantum systems are represented, in the density matrix representation; The When looking at fidelity with two systems, usually the target is the pure noisless system [8] thats rho, and the actual noisy system [8] thats sigma
Different authors define fidelity slightly differently, so thats why you see the two different traces here. 
tr is the trace of a matrix (sum of the diagonal elements)

For PROCESS fidelity, we define that fidelity for operations on systems, G. G is the target, and G(hat) is the actual. 
Unitary matrix G, the operation, is represented by that mapping [9]

Process Fidelity is not the best all around metric for benchmarking quantum systems, but fidelity is one of the more defined ones and gives you a rough idea of how close a noisy system is to a noiseless one. 


# Applicable Noise Models and Detection
- We don't have a way to imlpement an existing noise model on the regetti, but with more time, we had hoped to explore some techniques we read about.

- Depolarizing noise or Pauli noise model extended, which is said to be one of the easier ones to model noise from interactions with the environment. The method is to have a set of gates, and probabilistically place one of them into the circuit at random. They can be a mix of Pauli and Clifford noise channels. And this is supposed to improve process fidelity or how close output is to the target.

- We also came across a method that detects cross-talk. To visualize relationships between pairs of qubits, the method is to construct a quantum noise correlation matrix for qubit-qubit interactions. This would give an estimate of the probability distribution of the average noise in the system. Their protocol also randomly inserts sequences of Clifford gates, gets the outputs statistics from each measurement, then have the estimated the probability distribution undergo Walsh-Hadamard transform (a kind of Fourier transform), and then those values are used to construct a list of effective observed error rates. 


