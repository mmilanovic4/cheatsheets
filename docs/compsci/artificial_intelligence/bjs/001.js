const bjs = require('brain.js');

// Пример #1
const colors = [
	{ green: 0.2, blue: 0.4 },
	{ green: 0.4, blue: 0.6 },
	{ red: 0.2, green: 0.8, blue: 0.8 },
	{ green: 1, blue: 1 },
	{ red: 0.8, green: 1, blue: 1 },
	{ red: 1, green: 1, blue: 1 },
	{ red: 1, green: 0.8, blue: 0.8 },
	{ red: 1, green: 0.6, blue: 0.6 },
	{ red: 1, green: 0.4, blue: 0.4 },
	{ red: 1, green: 0.31, blue: 0.31 },
	{ red: 0.8 },
	{ red: 0.6, green: 0.2, blue: 0.2 }
];

const brightnesses = [
	{ dark: 0.8 },
	{ neutral: 0.8 },
	{ light: 0.7 },
	{ light: 0.8 },
	{ light: 0.9 },
	{ light: 1 },
	{ light: 0.8 },
	{ neutral: 0.7, light: 0.5 },
	{ dark: 0.5, neutral: 0.5 },
	{ dark: 0.6, neutral: 0.3 },
	{ dark: 0.85 },
	{ dark: 0.9 }
];

// Припрема података за тренинг
const trainingData = colors.map((color, index) => {
	return {
		input: { ...color },
		output: { ...brightnesses[index] }
	};
});

// Формат података: [ { input: { green: 0.2, blue: 0.4 }, output: { dark: 0.8 } }... ]
console.log(trainingData);

// ВНН - иницијализација
const net = new bjs.NeuralNetwork({
	hiddenLayers: [3]
});

// ВНН - тренинг
net.train(trainingData, {
	log: ({ error, iterations }) => {
		console.log(`Iterations: ${iterations}`);
		console.log(`Error: ${error}`);
		console.log('--');
	}
});

// Помоћна функција
function printResults(input) {
	console.log(input);
	const output = net.run(input);
	const { dark, neutral, light } = output;

	console.log(`dark | ${dark}`);
	console.log(`neutral | ${neutral}`);
	console.log(`light | ${light}`);
	console.log('--');
}

// ВНН - извршавање
printResults({ red: 0.9 });
printResults({ red: 0.5, green: 0.5, blue: 0.5 });
printResults({ green: 1.0, blue: 1.0 });

// Пример #2: инвертовани подаци
const invertedTrainingData = trainingData.map((row) => {
	const { input: output, output: input } = row;
	return { input, output };
});

// Формат података: [ { input: { dark: 0.8 }, output: { green: 0.2, blue: 0.4 } }... ]
console.log(invertedTrainingData);

// ВНН - иницијализација
const netWithInvertedData = new bjs.NeuralNetwork({
	hiddenLayers: [3]
});

// ВНН - тренинг
const stats = netWithInvertedData.train(invertedTrainingData);
const { error, iterations } = stats;
console.log(`Iterations: ${iterations}`);
console.log(`Error: ${error}`);

// ВНН - извршавање
console.log(netWithInvertedData.run({ dark: 1 }));
