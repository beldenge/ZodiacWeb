<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to ZodiacWeb</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>What's the Point?</h1>
			This is a web application interface to make it easier to run the genetic algorithm in hopes of eventually solving the Zodiac Killer's 340 Cipher.  This should facilitate delving into the solution sets produced by running the algorithm and provide some statistical introspection.
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to ZodiacWeb</h1>
			<p>Don't hate.  I'm a middleware developer; not a GUI designer.</p>
			<div id="controller-list" role="navigation">
				<h2>So what would you like to do?</h2>
				<ul>
						<li class="controller"><g:link controller="GeneticAlgorithm" action="run">Run the genetic algorithm</g:link></li>
				</ul>
				<h2>Browse some entities if you like:</h2>
				<ul>
						<li class="controller"><g:link controller="SolutionSet">Solution Set</g:link></li>
						<li class="controller"><g:link controller="Solution">Solution</g:link></li>
						<li class="controller"><g:link controller="Plaintext">Plaintext</g:link></li>
						<li class="controller"><g:link controller="Cipher">Cipher</g:link></li>
						<li class="controller"><g:link controller="Ciphertext">Ciphertext</g:link></li>
						<li class="controller"><g:link controller="Word">Word</g:link></li>
				</ul>
			</div>
		</div>
	</body>
</html>
