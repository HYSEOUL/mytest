<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Push Codelab</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
<link rel="stylesheet" href="styles/index.css">
<style>
html {
	height: 100%;
}

html, body {
	width: 100%;
	padding: 0;
	margin: 0;
}

body {
	min-height: auto;
	box-sizing: border-box;
}

header {
	padding: 115px 0 32px 0;
	background-color: #00bcd4;
	color: white;
}

main, header>h1 {
	padding: 0 16px;
	max-width: 760px;
	box-sizing: border-box;
	margin: 0 auto;
}

main {
	margin: 24px auto;
	box-sizing: border-box;
}

pre {
	white-space: pre-wrap;
	background-color: #EEEEEE;
	padding: 16px;
}

pre code {
	word-break: break-word;
}

.is-invisible {
	opacity: 0;
}

.subscription-details {
	transition: opacity 1s;
}

@media ( max-width : 600px) {
	header>h1 {
		font-size: 36px;
	}
}
</style>
<script>

'use strict';

const applicationServerPublicKey = 'BLZfBbzboWFM9ju9ZX0_wbMVTgai2LYyVcDnCScolUT2x1S-7rGbUbevl-yIyIPCCu408l-kP7g4zrQCW-BicJM';

const pushButton = document.querySelector('.js-push-btn');

let isSubscribed = false;
let swRegistration = null;

function urlB64ToUint8Array(base64String) {
  const padding = '='.repeat((4 - base64String.length % 4) % 4);
  const base64 = (base64String + padding)
    .replace(/\-/g, '+')
    .replace(/_/g, '/');

  const rawData = window.atob(base64);
  const outputArray = new Uint8Array(rawData.length);

  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
}

function updateBtn() {
  if (Notification.permission === 'denied') {
    pushButton.textContent = 'Push Messaging Blocked.';
    pushButton.disabled = true;
    updateSubscriptionOnServer(null);
    return;
  }

  if (isSubscribed) {
    pushButton.textContent = 'Disable Push Messaging';
  } else {
    pushButton.textContent = 'Enable Push Messaging';
  }

  pushButton.disabled = false;
}

function updateSubscriptionOnServer(subscription) {
  // TODO: Send subscription to application server

  const subscriptionJson = document.querySelector('.js-subscription-json');
  const subscriptionDetails =
    document.querySelector('.js-subscription-details');

  if (subscription) {
    subscriptionJson.textContent = JSON.stringify(subscription);
    subscriptionDetails.classList.remove('is-invisible');
  } else {
    subscriptionDetails.classList.add('is-invisible');
  }
}

function subscribeUser() {
  const applicationServerKey = urlB64ToUint8Array(applicationServerPublicKey);
  swRegistration.pushManager.subscribe({
    userVisibleOnly: true,
    applicationServerKey: applicationServerKey
  })
  .then(function(subscription) {
    console.log('User is subscribed');

    updateSubscriptionOnServer(subscription);

    isSubscribed = true;

    updateBtn();
  })
  .catch(function(err) {
    console.log('Failed to subscribe the user: ', err);
    updateBtn();
  });
}

function initializeUI() {
  pushButton.addEventListener('click', function() {
    pushButton.disabled = true;
    if (isSubscribed) {
      // TODO: Unsubscribe user
    } else {
      subscribeUser();
    }
  });

  // Set the initial subscription value
  swRegistration.pushManager.getSubscription()
  .then(function(subscription) {
    isSubscribed = !(subscription === null);

    updateSubscriptionOnServer(subscription);

    if (isSubscribed) {
      console.log('User IS subscribed.');
    } else {
      console.log('User is NOT subscribed.');
    }
    updateBtn();
  });
}

if ('serviceWorker' in navigator && 'PushManager' in window) {
  console.log('Service Worker and Push is supported');

  navigator.serviceWorker.register('sw.js')
  .then(function(swReg) {
    console.log('Service Worker is registered', swReg);

    swRegistration = swReg;
    initializeUI();
  })
  .catch(function(error) {
    console.error('Service Worker Error', error);
  });
} else {
  console.warn('Push messaging is not supported');
  pushButton.textContent = 'Push Not Supported';
}

</script>

<script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
</head>

<body>

	<header>
		<h1>Push Codelab</h1>
	</header>

	<main>
	<p>Welcome to the push messaging codelab. The button below needs to
		be fixed to support subscribing to push.</p>
	<p>
		<button disabled
			class="js-push-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
			Enable Push Messaging</button>
	</p>
	<section
		class="subscription-details js-subscription-details is-invisible">
		<p>Once you've subscribed your user, you'd send their subscription
			to your server to store in a database so that when you want to send a
			message you can lookup the subscription and send a message to it.</p>
		<p>
			To simplify things for this code lab copy the following details into
			the <a href="https://web-push-codelab.glitch.me/">Push Companion
				Site</a> and it'll send a push message for you, using the application
			server keys on the site - so make sure they match.
		</p>
		<pre>
			<code class="js-subscription-json"></code>
		</pre>
	</section>
	</main>

	<script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
</body>
</html>


