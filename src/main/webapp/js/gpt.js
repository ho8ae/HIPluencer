
//GPT 기능 구현 테스
// GPT에게 질문을 보내는 함수


document.getElementById('gptAskBtn').addEventListener('click', askGpt);



function askGpt() {
	var userInput = document.getElementById('gptQuery').value.trim();
	var typingText = document.getElementById('typing-text');
	var gptError = document.getElementById('gpt-error');
	var gptAnswer = document.getElementById('gpt-answer');

	if (userInput === "") {
		gptError.innerHTML = "질문을 입력해주세요.";
		gptError.classList.remove("d-none");
		gptAnswer.classList.add("d-none");
		return;
	}

	typingText.innerHTML = "";
	gptError.classList.add("d-none");
	gptAnswer.classList.remove("d-none");

	var typingInterval = showTypingAnimation();

	getGptAnswer(userInput, function(answer, error) {
		clearInterval(typingInterval);
		if (error) {
			typingText.innerHTML = "오류가 발생했습니다. 다시 시도해주세요.";
		} else {
			typingText.innerHTML = answer;
		}
	});
}


function getGptAnswer(query, callback) {
	//var apiKey = '';
	var apiEndpoint = 'https://api.openai.com/v1/chat/completions';
	var requestOptions = {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'Authorization': 'Bearer ' + apiKey
		},
		body: JSON.stringify({
			model: "gpt-3.5-turbo",
			messages: [{ role: "user", content: query }],
			temperature: 0.8,
			max_tokens: 1024,
			top_p: 1,
			frequency_penalty: 0.5,
			presence_penalty: 0.5,
		}),
	};

	fetch(apiEndpoint, requestOptions)
		.then(response => {
			if (!response.ok) {
				throw new Error('OpenAI API 호출 중 오류 발생');
			}
			return response.json();
		})
		.then(data => {
			var aiResponse = data.choices[0].message.content;
			callback(aiResponse, null);
		})
		.catch(error => {
			callback(null, error);
		});
}



function showTypingAnimation() {
	var dots = 0;
	var typingText = document.getElementById("typing-text");
	var typingInterval = setInterval(function() {
		typingText.innerHTML = "답변을 준비중" + ".".repeat(dots);
		dots = (dots + 1) % 4;
	}, 500); // 0.5초마다 타이핑 애니메이션을 업데이트합니다.
	return typingInterval;
}


