-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 15, 2024 at 10:15 AM
-- Server version: 8.0.37-0ubuntu0.22.04.3
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vizion-ai`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL DEFAULT '1',
  `longitude` double NOT NULL DEFAULT '1',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `addressable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressable_id` bigint UNSIGNED NOT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_line_1`, `address_line_2`, `postal_code`, `city`, `state`, `country`, `latitude`, `longitude`, `is_primary`, `addressable_type`, `addressable_id`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '23, Square Street', 'Near Sea View Point', '445632', '10001', '3866', '230', 1, 1, 0, 'App\\Models\\User', 3, NULL, NULL, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57', NULL),
(2, '3, Hill Street', 'Near Mile View Building', '442387', '10002', '3866', '230', 1, 1, 0, 'App\\Models\\User', 3, NULL, NULL, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `name`, `parent_id`, `status`, `type`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'blog', 'Blog', NULL, 1, 'ai_writer', NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(2, 'development', 'Development', NULL, 1, 'ai_writer', NULL, NULL, NULL, '2024-06-15 04:45:01', '2024-06-15 04:45:01', NULL),
(3, 'advertisement', 'Advertisement', NULL, 1, 'ai_writer', NULL, NULL, NULL, '2024-06-15 04:45:01', '2024-06-15 04:45:01', NULL),
(4, 'social-media', 'Social media', NULL, 1, 'ai_writer', NULL, NULL, NULL, '2024-06-15 04:45:01', '2024-06-15 04:45:01', NULL),
(5, 'photo-enhancer', 'Photo Enhancer', NULL, 1, 'ai_image', NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02', NULL),
(6, 'face-enhancer', 'Face Enhancer', NULL, 1, 'ai_image', NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `user_id`, `title`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, 3, 'Exploring the Future of Autonomous Vehicles and Their Impact', 3, 3, NULL, NULL, '2024-02-26 06:03:57', '2024-02-26 06:04:36'),
(8, 3, 'Impact of Big Data Analytics on Healthcare Outcomes and Strategies', 3, 3, NULL, NULL, '2024-02-26 06:06:02', '2024-02-26 06:06:37'),
(9, 3, 'Exploring Flutter\'s Hot Reload: A Revolution in App Development', 3, 3, NULL, NULL, '2024-02-26 06:07:47', '2024-02-26 06:08:21'),
(10, 3, 'Navigating Post-Pandemic Global Economic Recovery: Outlook & Challenges', 3, 3, NULL, NULL, '2024-02-26 06:09:20', '2024-02-26 06:10:01'),
(11, 3, 'Recent Advances in Global Climate Change Policies and Initiatives', 3, 3, NULL, NULL, '2024-02-26 06:10:15', '2024-02-26 06:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `chat_history_image`
--

CREATE TABLE `chat_history_image` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_history_image`
--

INSERT INTO `chat_history_image` (`id`, `user_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 3, NULL, NULL, '2024-02-26 06:18:08', '2024-02-26 06:18:08'),
(2, 3, 3, 3, NULL, NULL, '2024-02-26 06:19:00', '2024-02-26 06:19:00'),
(3, 3, 3, 3, NULL, NULL, '2024-02-26 06:20:33', '2024-02-26 06:20:33'),
(4, 3, 3, 3, NULL, NULL, '2024-02-26 06:21:34', '2024-02-26 06:21:34'),
(5, 3, 3, 3, NULL, NULL, '2024-02-26 06:23:06', '2024-02-26 06:23:06'),
(6, 3, 3, 3, NULL, NULL, '2024-02-26 06:23:07', '2024-02-26 06:23:07'),
(7, 3, 3, 3, NULL, NULL, '2024-02-26 06:31:33', '2024-02-26 06:31:33'),
(8, 3, 3, 3, NULL, NULL, '2024-02-26 06:31:36', '2024-02-26 06:31:36'),
(9, 3, 3, 3, NULL, NULL, '2024-02-26 06:31:59', '2024-02-26 06:31:59'),
(10, 3, 3, 3, NULL, NULL, '2024-02-26 06:32:21', '2024-02-26 06:32:21'),
(11, 3, 3, 3, NULL, NULL, '2024-02-26 06:33:26', '2024-02-26 06:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `chat_history_mapping`
--

CREATE TABLE `chat_history_mapping` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` int DEFAULT NULL,
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `message_text` text COLLATE utf8mb4_unicode_ci,
  `time` datetime DEFAULT NULL,
  `word_count` int DEFAULT NULL,
  `image_count` int DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_history_mapping`
--

INSERT INTO `chat_history_mapping` (`id`, `chat_id`, `from`, `to`, `message_text`, `time`, `word_count`, `image_count`, `images`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, -11, 'Please exploring the impact of blockchain technology on the finance industry.', '2024-02-26 16:59:00', 11, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 05:58:57', '2024-02-26 05:58:57'),
(2, 1, -11, 3, 'Blockchain technology has been revolutionizing various sectors since its inception, and the finance industry stands out as one of the most significantly impacted fields. Here’s a comprehensive exploration of how blockchain is influencing the finance sector:\\n\\n### 1. **Decentralization of Financial Operations**\\n\\nBlockchain technology operates on a decentralized network, removing the need for traditional financial intermediaries such as banks. This decentralization reduces transaction times and costs, making financial operations more efficient. It allows for peer-to-peer transactions without the need for a central clearing authority, thus democratizing financial transactions and making them accessible to more people globally.\\n\\n### 2. **Enhanced Security**\\n\\nBlockchain’s cryptographic nature ensures that financial transactions are secure and immutable. Once a transaction is recorded in a block, it cannot be altered without changing every subsequent block, which requires consensus across the network. This security aspect is crucial for preventing fraud and unauthorized access to financial information.\\n\\n### 3. **Increased Transparency**\\n\\nEach transaction on a blockchain is recorded on a public ledger, making the details visible to all participants and ensuring a high level of transparency. This can reduce corruption and misuse of funds in financial transactions while building trust among users.\\n\\n### 4. **Smart Contracts**\\n\\nSmart contracts are self-executing contracts with the terms of the agreement directly written into lines of code. They automatically enforce and execute the terms of a contract when predetermined conditions are met. In the finance industry, this means that complex transactions and agreements can be automated, reducing the need for intermediaries and therefore decreasing costs further.\\n\\n### 5. **Cross-Border Transactions**\\n\\nBlockchain facilitates faster and more cost-effective cross-border transactions compared to traditional banking systems. This is particularly beneficial for remittances and international trade, where transactions can be processed in minutes or seconds, rather than days, and without the high fees typically associated with currency conversion and transfer across borders.\\n\\n### 6. **Tokenization of Assets**\\n\\nBlockchain enables the tokenization of real-world assets such as real estate, art, or commodities, making them easier to trade and divide among multiple owners. This can increase liquidity in the market and open up new investment opportunities, particularly in assets that were previously difficult to divide or sell.\\n\\n### 7. **Regulatory Challenges and Compliance**\\n\\nAs blockchain continues to evolve, regulatory bodies are exploring ways to ensure the technology abides by existing financial laws and regulations. Compliance and regulatory acceptance are crucial for blockchain’s integration into mainstream finance, as they ensure investor protection and financial stability.\\n\\n### 8. **Impact on Employment and Skill Sets**\\n\\nThe adoption of blockchain technology requires a shift in skill sets for finance professionals. There\'s a growing demand for blockchain expertise, including understanding smart contracts, cryptocurrency, and decentralized finance (DeFi) operations. As such, the financial workforce is evolving to meet these new technological demands.\\n\\n### Conclusion\\n\\nBlockchain technology presents vast opportunities for innovation within the finance industry. By significantly enhancing the efficiency, security, and accessibility of financial transactions, it\'s poised to reshape the landscape of global finance. However, its full potential and widespread adoption depend on overcoming regulatory challenges and ensuring the technology’s integration into existing financial systems in a manner that benefits all stakeholders.\\n\\nAdopting blockchain represents a paradigm shift in the way financial transactions are conducted, promising a more inclusive, efficient, and secure financial world.', '2024-02-26 16:59:00', 521, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 05:58:58', '2024-02-26 05:58:58'),
(3, 2, 3, -11, 'What is the future of autonomous vehicles and their potential societal implications?', '2024-02-26 17:00:00', 12, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 05:59:59', '2024-02-26 05:59:59'),
(4, 2, -11, 3, 'The future of autonomous vehicles (AVs), or driverless cars, presents a transformative trajectory with significant potential societal implications across various dimensions. As we move towards increased adoption and technological maturity, there are several key aspects to consider:\\n\\n### Enhancements in Safety\\n- **Reduction in Accidents:** Human error accounts for a significant percentage of road accidents. AVs, with their reliance on sensors, AI, and machine learning, promise to drastically reduce these incidents, potentially saving lives.\\n- **Predictable Traffic Flow:** Autonomous vehicles can communicate with each other to maintain optimal speed and distance, reducing the likelihood of traffic congestions and accidents.\\n\\n### Efficiency and Environmental Impact\\n- **Decreased Traffic Congestion:** Enhanced traffic management through autonomous vehicles could lead to smoother flows, significantly reducing idle time in traffic and the associated emissions.\\n- **Energy Efficiency:** Optimized driving patterns and the potential for electric vehicle integration can lower the carbon footprint, contributing to environmental sustainability goals.\\n\\n### Economic Implications\\n- **Impact on Job Markets:** There\'s a dichotomy in economic implications; while new technological and maintenance roles may emerge, traditional roles like truck and taxi drivers could be at risk.\\n- **Cost of Goods and Services:** Autonomous delivery vehicles could reduce the cost of goods and shipping, potentially making services more affordable for consumers.\\n\\n### Accessibility and Urban Planning\\n- **Increased Mobility for Everyone:** People who are unable to drive because of age, disability, or other factors could gain new independence, enhancing their quality of life.\\n- **Transformation of Urban Spaces:** Reduced need for parking spaces could allow cities to repurpose these areas, possibly creating more green spaces or areas for public use.\\n\\n### Ethical and Policy Considerations\\n- **Privacy Concerns:** Data collection by AVs raises questions about privacy and data security, requiring robust policies.\\n- **Regulatory Frameworks:** Governments will need to create comprehensive regulations for AV testing and integration, including standards for safety and interoperability between different types of vehicles.\\n\\n### Potential Downsides\\n- **Security Risks:** As with any connected technology, there\'s a risk of hacking, which could have serious implications for safety.\\n- **Social and Economic Disparities:** There\'s a risk that benefits like reduced transportation costs and improved safety could disproportionately advantage wealthier individuals and communities, exacerbating social divides.\\n\\nIn conclusion, while the advancement of autonomous vehicles holds the promise of revolutionizing transportation, it simultaneously presents a complex array of challenges and opportunities. Balancing these will require concerted efforts from governments, industry stakeholders, and the global community to ensure that the transition to an autonomous future is as inclusive, safe, and beneficial as possible.', '2024-02-26 17:00:00', 402, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:00:01', '2024-02-26 06:00:01'),
(5, 3, 3, -11, 'Please exploring the impact of blockchain technology on the finance industry.', '2024-02-26 17:00:00', 11, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:00:53', '2024-02-26 06:00:53'),
(6, 3, -11, 3, 'Blockchain technology has profoundly transformed the finance industry, pioneering a shift towards decentralization, enhanced security, and increased efficiency. Its impact is multifaceted, affecting various aspects of finance including banking, payments, investments, and beyond. Let\'s delve into some of the key areas of its influence:\\n\\n### 1. **Decentralization of Financial Systems**\\nBlockchain facilitates the creation of decentralized financial systems, which means that transactions can occur directly between parties without the need for intermediaries like banks. This can lead to decreased transaction costs, faster settlement times, and increased accessibility for unbanked populations worldwide.\\n\\n### 2. **Enhanced Security and Transparency**\\nAt its core, blockchain is a distributed ledger technology where all transactions are recorded in a tamper-evident and irreversible manner. This significantly reduces the risk of fraud and unauthorized activities. Additionally, the transparent nature of blockchain ensures that all parties have access to the same information, fostering trust among users.\\n\\n### 3. **Smart Contracts**\\nSmart contracts are self-executing contracts with the terms of the agreement directly written into code. They automatically enforce and execute the terms of a contract when predetermined conditions are met. In finance, this means automating complex processes like claims processing, dividend payments, and compliance, thereby reducing the need for intermediaries and lowering transaction costs.\\n\\n### 4. **Tokenization of Assets**\\nBlockchain allows for the tokenization of real-world assets such as real estate, artworks, or shares of a company, making them easier to divide, transfer, and trade on digital platforms. This could open up investment opportunities to a broader range of investors and improve the liquidity of many types of assets.\\n\\n### 5. **Cross-Border Payments**\\nBlockchain technology can streamline cross-border payments, making them faster, cheaper, and more secure. Traditional methods can be slow and involve high fees, particularly for remittances. Blockchain offers an alternative by facilitating real-time transactions with lower fees, benefiting both businesses and migrant workers sending money home.\\n\\n### 6. **Regulatory Compliance and KYC**\\nBlockchain can also assist in simplifying compliance with regulatory requirements, including Know Your Customer (KYC) and anti-money laundering (AML) directives. Immutable records can provide auditors with a transparent trail of transactions, making it easier to monitor and enforce compliance.\\n\\n### 7. **Challenges and Considerations**\\nWhile blockchain presents numerous opportunities, it also faces challenges. Scalability, interoperability between different blockchains, regulatory uncertainties, and energy consumption (especially for proof-of-work blockchains) are significant issues that need addressing. Furthermore, broader adoption requires significant investment in technology and a shift in mindset from centralized to decentralized financial services.\\n\\n### Conclusion\\nBlockchain technology continues to disrupt the financial industry by offering solutions that promise improved efficiency, security, and inclusivity. Its potential to revolutionize various aspects of finance is undeniable, though achieving its full transformative impact will require overcoming technical, regulatory, and adoption hurdles. The finance industry is just beginning to tap into the vast possibilities offered by blockchain, and its journey towards mainstream adoption will be an area to watch in the coming years.', '2024-02-26 17:00:00', 466, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:00:54', '2024-02-26 06:00:54'),
(7, 4, 3, -11, 'Hello there', '2024-02-26 17:02:00', 2, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:02:07', '2024-02-26 06:02:07'),
(8, 4, -11, 3, 'Hello! How can I assist you today?', '2024-02-26 17:02:00', 7, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:02:08', '2024-02-26 06:02:08'),
(9, 5, 3, -11, 'Exploring the impact of blockchain technology on the finance industry.', '2024-02-26 17:03:00', 10, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:03:42', '2024-02-26 06:03:42'),
(10, 5, -11, 3, 'Blockchain technology has been a groundbreaking development for various industries, with particularly significant impacts on the finance sector. Its key characteristics—decentralization, transparency, security, and immutability—present a transformative potential for how financial transactions and data are managed. Here are some ways through which blockchain is influencing the finance industry:\\n\\n### 1. Increased Transparency and Efficiency\\nBlockchain\'s inherent transparency ensures that all parties in the network have access to the same information, significantly reducing the possibility of disputes and the need for intermediaries. This level of transparency, coupled with the immutable nature of blockchain, leads to increased trust among parties. Moreover, blockchain enables real-time settlement of transactions, cutting down the time and cost associated with traditional banking processes.\\n\\n### 2. Enhanced Security\\nSecurity is pivotal in the finance industry, and blockchain technology offers advanced security measures through its decentralized nature and cryptographic hash functions. Since every transaction is recorded on a block and across multiple copies of the ledger that are distributed over many nodes (computers), it is highly resistant to malicious attacks and fraud.\\n\\n### 3. Disruption of Traditional Banking\\nBlockchain technology is challenging the traditional banking system by facilitating peer-to-peer payments, loans, and crowdfunding platforms. Services like international transfers, which usually take days and involve high fees, can be executed more swiftly and cheaply using blockchain. This is particularly advantageous for global remittances and micro-payments.\\n\\n### 4. Smart Contracts\\nSmart contracts are self-executing contracts where the terms of the agreement between buyer and seller are directly written into lines of code. These digital contracts can automate and streamline complex processes in financial services, such as claims processing in insurance, thereby reducing the need for intermediaries and making the processes more efficient.\\n\\n### 5. Tokenization of Assets\\nBlockchain enables the tokenization of real-world assets like real estate, art, or commodities, allowing them to be bought, sold, and traded more efficiently and opening up investment opportunities to a broader audience. This can greatly increase liquidity in markets that are traditionally illiquid.\\n\\n### 6. Impact on Regulatory and Compliance Processes\\nThe immutable and transparent nature of blockchain can greatly improve regulatory reporting and compliance processes. Since all transactions are recorded and cannot be altered, auditing becomes more straightforward, enhancing the accuracy of records and reducing the potential for financial malfeasance.\\n\\n### 7. Development of Decentralized Finance (DeFi)\\nDeFi uses blockchain and cryptocurrencies to manage financial transactions outside traditional banking. It offers numerous financial instruments without the need for intermediaries, such as banks, allowing for lending, borrowing, and earning interest directly between parties.\\n\\n### Challenges and Considerations\\nDespite its benefits, blockchain faces challenges such as regulatory uncertainty, scalability issues, and the need for significant energy resources for certain consensus mechanisms (like Proof of Work). Moreover, its potential for disintermediation might be met with resistance from established financial institutions.\\n\\nAs blockchain continues to evolve, its integration into the finance industry could redefine the way financial services are provided, making them more transparent, efficient, and accessible. However, to fully realize its potential, these challenges must be addressed through technological advances and regulatory frameworks.', '2024-02-26 17:03:00', 490, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:03:44', '2024-02-26 06:03:44'),
(11, 6, 3, -11, 'Exploring the impact of blockchain technology on the finance industry.', '2024-02-26 17:04:00', 10, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:04:07', '2024-02-26 06:04:07'),
(12, 6, -11, 3, 'Blockchain technology has been a transformative force in the finance industry, significantly impacting various aspects of how financial transactions and systems operate. Here\'s a look at some of the key areas where blockchain has had a profound impact:\\n\\n1. **Decentralization**: Blockchain enables the decentralization of financial transactions. By allowing data to be distributed across a network, rather than stored in a central database, blockchain reduces the risk of central points of failure and increases the security of the financial data.\\n\\n2. **Transparency and Trust**: The transparent nature of blockchain technology, where transactions are recorded on a public ledger, fosters trust among participants. This transparency ensures that all transactions are visible and audit-able by all parties involved, reducing the possibility of fraud and errors.\\n\\n3. **Reduced Transaction Costs and Times**: Blockchain can significantly reduce transaction costs by eliminating the need for intermediaries, such as banks and clearinghouses, in the transaction process. Additionally, blockchain can increase the speed of transactions, as it allows for real-time settlement of trades, eliminating the need for multi-day waiting periods.\\n\\n4. **Improved Security**: Through the use of advanced cryptography, blockchain technology offers enhanced security for financial transactions. This makes it extremely difficult for hackers to alter transaction data, thus providing a secure environment for financial operations.\\n\\n5. **Smart Contracts**: One of the revolutionary aspects of blockchain in finance is the introduction of smart contracts. These are self-executing contracts with the terms of the agreement directly written into lines of code. Smart contracts automate and enforce the execution of contract terms, reducing the need for intermediaries and increasing the efficiency of numerous financial transactions like loans, insurance, and bonds.\\n\\n6. **Tokenization**: Blockchain facilitates the tokenization of assets, including real estate, art, and even traditional securities like stocks and bonds. This process involves converting rights to an asset into a digital token on a blockchain. Tokenization can improve the liquidity of high-value asset markets, enable fractional ownership, and streamline the process of buying, selling, and transferring assets.\\n\\n7. **Cross-Border Payments**: Blockchain technology has dramatically improved the efficiency of cross-border transactions. By enabling direct transactions between parties on a global scale without the need for currency exchange or third-party interventions, blockchain reduces transaction times from days to minutes and significantly cuts costs.\\n\\n8. **Regulatory Challenges and Compliance**: The decentralized and global nature of blockchain presents new challenges in regulatory compliance and anti-money laundering (AML) efforts. The finance industry and regulatory bodies are continuously working to develop frameworks that can accommodate the innovative aspects of blockchain while ensuring legal compliance and protecting consumers.\\n\\n9. **Central Bank Digital Currencies (CBDCs)**: Many countries are exploring or have already launched their digital currencies based on blockchain technology. CBDCs represent a significant endorsement of blockchain\'s capabilities and have the potential to further transform the financial landscape by streamlining payments and making monetary policy implementation more effective.\\n\\nIn conclusion, blockchain technology is reshaping the finance industry by enhancing security, transparency, efficiency, and inclusivity. Despite facing regulatory, technical, and adoption hurdles, the potential benefits of blockchain could lead to a more open, accessible, and equitable global financial system.', '2024-02-26 17:04:00', 501, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:04:08', '2024-02-26 06:04:08'),
(13, 7, 3, -11, 'What is the future of autonomous vehicles and their potential societal implications?', '2024-02-26 17:04:00', 12, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:04:37', '2024-02-26 06:04:37'),
(14, 7, -11, 3, 'The future of autonomous vehicles (AVs) is a vibrant and rapidly evolving field, with advancements and developments occurring regularly. As this technology advances towards wider adoption, it\'s set to have profound implications on society across several dimensions. Here\'s an outline of potential futures and societal implications:\\n\\n### Technological Advancements\\n\\n1. **Improved Safety**: As AI and machine learning technologies advance, autonomous vehicles are expected to become safer than human-driven cars, potentially reducing accidents caused by human error.\\n2. **Integration with Smart Cities**: AVs are likely to integrate seamlessly with smart city infrastructure, enhancing traffic management and reducing congestion.\\n3. **Advancements in Connectivity**: Enhanced vehicle-to-vehicle (V2V) and vehicle-to-infrastructure (V2I) communications will likely facilitate smoother traffic flows and more efficient transportation systems.\\n\\n### Environmental Impact\\n\\n1. **Emission Reduction**: If AVs are predominantly electric, their widespread adoption could significantly reduce vehicle emissions, contributing to cleaner air.\\n2. **Energy Efficiency**: Autonomous vehicles, through optimal routing and driving practices, could reduce energy consumption.\\n\\n### Societal and Economic Implications\\n\\n1. **Mobility for All**: AVs have the potential to offer mobility solutions for the elderly, disabled, and those unable to drive, enhancing their independence.\\n2. **Employment Shifts**: While the demand for traditional driving jobs may decline, new opportunities in AV maintenance, software development, and fleet management could arise.\\n3. **Urban Design and Infrastructure**: Cities might evolve with less need for parking spaces, leading to more pedestrian-friendly urban designs and potentially changing real estate values.\\n4. **Insurance and Liability**: With the shift from driver to system control, there will be significant changes in insurance models and questions about liability in accidents.\\n\\n### Challenges and Considerations\\n\\n1. **Cybersecurity**: Protecting AVs from hacking and ensuring data privacy will be crucial.\\n2. **Ethical and Legal Issues**: Establishing legal frameworks for liability, as well as ethical guidelines for decision-making algorithms, will be imperative.\\n3. **Equity and Accessibility**: Ensuring equitable access to AV technology will be a significant challenge, avoiding a scenario where only the wealthy benefit.\\n4. **Transition Period**: The coexistence of autonomous and human-driven vehicles presents its own set of challenges for safety and infrastructure adaptation.\\n\\n### Conclusion\\n\\nThe trajectory for autonomous vehicles is geared towards creating a safer, more efficient, and inclusive transportation system. However, this vision comes with notable challenges, particularly around legal, ethical, and security concerns. Balancing technological advancement with thoughtful consideration of these aspects is essential for realizing the full potential of AVs in society. The transformation promised by autonomous vehicles is not just about the vehicles themselves but reflects a broader shift in how we conceive of transportation, urban living, and community connectivity.', '2024-02-26 17:04:00', 407, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:04:39', '2024-02-26 06:04:39'),
(15, 8, 3, -11, 'Examining the role of big data analytics in shaping healthcare outcomes and patient care strategies.', '2024-02-26 17:06:00', 15, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:06:39', '2024-02-26 06:06:39'),
(16, 8, -11, 3, 'Big data analytics plays a crucial role in transforming healthcare outcomes and patient care strategies. By leveraging vast amounts of data from various sources, healthcare providers can achieve a more comprehensive understanding of patient health, enhance diagnostic accuracy, and tailor care procedures to meet individual needs more effectively. Here are several key areas where big data analytics is making a significant impact:\\n\\n1. **Predictive Analytics:** Predictive models can analyze past and current health data to forecast potential future health events or conditions for patients. This allows healthcare providers to intervene proactively, potentially preventing conditions from worsening or even occurring in the first place.\\n\\n2. **Personalized Medicine:** Big data analytics supports the development of personalized medicine, where treatments and medications are tailored to the individual characteristics of each patient, such as genetic makeup, environment, and lifestyle. This approach can significantly improve treatment effectiveness and reduce side effects.\\n\\n3. **Disease Surveillance and Management:** Through the analysis of data collected from a variety of sources, including electronic health records (EHRs), social media, and wearable technology, public health officials can monitor and respond more effectively to disease outbreaks. This can improve disease management strategies, resource allocation, and ultimately control the spread of diseases more efficiently.\\n\\n4. **Operational Efficiency and Cost Reduction:** Healthcare facilities can use big data analytics to identify inefficiencies in their operations, such as unnecessary testing, suboptimal resource allocation, and patient readmission rates. Addressing these issues can lead to improved patient care while simultaneously reducing costs.\\n\\n5. **Enhanced Patient Experience:** By analyzing patient feedback and interaction data, healthcare providers can identify areas for improvement in the patient care experience. This can include reducing waiting times, improving communication between patients and healthcare providers, and enhancing the quality of care delivered.\\n\\n6. **Clinical Decision Support:** Big data analytics can assist in clinical decision-making by providing healthcare professionals with evidence-based insights derived from vast amounts of clinical data. This can help in making more informed decisions, improving diagnoses, and optimizing treatment plans.\\n\\n7. **Research and Development:** Analytics can accelerate medical research by enabling the analysis of large datasets of clinical trial data, patient records, and genetic information to identify trends, potential therapies, and areas warranting further investigation. This can lead to faster development of new treatments and drugs.\\n\\n8. **Improved Health Policy Making:** By analyzing health trends and outcomes at a population level, policymakers can make more informed decisions regarding public health strategies, healthcare regulations, and resource allocation.\\n\\nIn conclusion, big data analytics is fundamentally reshaping healthcare outcomes and patient care strategies. By turning vast amounts of data into actionable insights, healthcare providers can offer more personalized, efficient, and proactive care, significantly improving patient outcomes and the overall efficiency of healthcare systems. However, it is also essential to address challenges related to data privacy, security, and integration to fully realize the benefits of big data analytics in healthcare.', '2024-02-26 17:06:00', 464, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:06:39', '2024-02-26 06:06:39'),
(17, 9, 3, -11, 'Discussing Flutter\'s hot reload feature and its impact on app development efficiency.', '2024-02-26 17:08:00', 12, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:08:22', '2024-02-26 06:08:22'),
(18, 9, -11, 3, 'Flutter\'s hot reload feature stands as a significant leap forward in the landscape of app development, particularly for those working on building cross-platform applications. This feature directly addresses one of the most common pain points encountered during app development - the iterative cycle of code modification and the subsequent need to reload the entire application to see the changes. By offering a faster, more efficient way to visualize changes in real-time, Flutter\'s hot reload has revolutionized the development workflow in several key areas:\\n\\n1. **Increased Productivity**: The primary impact of hot reload is on developer productivity. It allows developers to see the effects of their changes almost instantly, without needing to restart the app. This immediacy not only speeds up the development process but also makes it significantly more engaging, enabling a smoother flow of ideas and more rapid iteration.\\n\\n2. **Enhanced Debugging Process**: Debugging becomes much less of a chore with hot reload. Developers can tweak UI elements, fix bugs, and try out solutions on the fly, enabling a much more efficient debugging process. This immediacy also encourages experimentation, as changes can be easily made and reverted without consequence.\\n\\n3. **Improved Collaboration**: When working in teams, the immediate reflection of changes can facilitate better communication and collaboration among developers and designers. Seeing updates in real-time allows for quicker feedback cycles, making it easier to align on design adjustments and functionality improvements.\\n\\n4. **Cost Efficiency**: The time saved directly translates to cost savings. Faster development cycles mean that projects can be completed in lesser time, which can lead to reduced costs for both development teams and their clients.\\n\\n5. **Learning and Adoption**: For new developers entering the field, the hot reload feature makes Flutter an attractive option. The ability to immediately see the effects of code changes lowers the learning curve associated with understanding mobile app development concepts, making Flutter a compelling choice for both educational purposes and professional projects.\\n\\n6. **Cross-platform Consistency**: Since Flutter enables the development of both iOS and Android applications from a single codebase, hot reload helps ensure that any changes made reflect consistently across both platforms in real-time. This aids in maintaining uniformity and reduces the time and effort required to validate changes across different devices.\\n\\nHowever, it\'s also important to understand the limitations of hot reload. For example, hot reload does not apply to changes in initialization code that runs only when the app starts, and some types of changes may still require a full restart of the app to take effect. Despite these limitations, the feature represents a significant advancement in how developers approach the build and iteration cycle, making the process more intuitive and responsive than ever before.\\n\\nThe infusion of hot reload into Flutter\'s development toolkit not only enhances efficiency and productivity but also inspires a more creative and exploratory approach to app development. It embodies a significant stride towards more streamlined and developer-friendly app creation methodologies, solidifying Flutter\'s position as a go-to framework for modern app developers.', '2024-02-26 17:08:00', 489, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:08:23', '2024-02-26 06:08:23'),
(19, 10, 3, -11, 'What is the outlook for global economic recovery post-pandemic?', '2024-02-26 17:10:00', 9, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:10:02', '2024-02-26 06:10:02'),
(20, 10, -11, 3, 'As of my last update in April 2023, the global economic outlook post-pandemic is cautiously optimistic but also faces several challenges and uncertainties.\\n\\n### Positive Factors Supporting Recovery:\\n- **Vaccination Efforts**: Increased vaccination rates in many countries have helped in the gradual reopening of economies. This has boosted consumer confidence and spending.\\n- **Government Stimulus Measures**: Continuation of fiscal and monetary policies to support economies has been crucial. Many governments have implemented significant stimulus packages to bolster recovery.\\n- **Digital Transformation**: The pandemic has accelerated the adoption of digital technologies across sectors, leading to productivity gains and opening new opportunities for growth.\\n- **Global Trade Resilience**: After a significant downturn, global trade has started to bounce back, supported by recovering demand in goods, especially from economies leading in vaccination efforts.\\n\\n### Challenges and Uncertainties:\\n- **Inequality in Vaccine Distribution**: Differences in vaccine access between countries, particularly with many low-income countries lagging behind, pose a risk to global health and economic stability.\\n- **Supply Chain Disruptions**: The pandemic has exposed vulnerabilities in global supply chains, with shortages and logistics challenges causing inflationary pressures.\\n- **Rising Inflation**: Many countries are experiencing rising inflation due to supply chain disruptions, higher energy prices, and recovering demand, which central banks are closely monitoring.\\n- **Debt Levels**: Increased government spending during the pandemic has led to higher debt levels, which could constrain economic policy options in the future.\\n- **Geopolitical Tensions**: Ongoing tensions and conflicts in various parts of the world also add to the uncertainty, potentially affecting international trade and investment flows.\\n\\n### Looking Forward:\\nThe pace of recovery is expected to vary significantly across regions and sectors. Advanced economies, especially those with high vaccination rates and stimulus measures, may recover faster. However, emerging markets and developing economies face more pronounced challenges.\\n\\n- **Technology and Innovation**: Sectors that have adapted quickly to digital transformation are likely to lead the recovery.\\n- **Sustainability and Green Economy**: There\'s an increasing focus on sustainability and the transition to a green economy, offering new opportunities for growth.\\n- **Labor Market Adjustments**: The labor market is undergoing structural changes, with remote work becoming more common and certain sectors facing workforce shortages.\\n\\nIn conclusion, while there are reasons to be optimistic about the global economic recovery post-pandemic, vigilance is necessary due to existing challenges and uncertainties. Policies aimed at promoting equitable vaccine distribution, addressing inflation, and supporting sustainable growth will be crucial in shaping the trajectory of the recovery.', '2024-02-26 17:10:00', 391, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:10:03', '2024-02-26 06:10:03'),
(21, 11, 3, -11, 'What are the latest developments in climate change policies?', '2024-02-26 17:11:00', 9, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:10:54', '2024-02-26 06:10:54'),
(22, 11, -11, 3, 'As of my last update in early 2023, various governments, organizations, and stakeholders worldwide have been actively working on implementing and updating climate change policies to address the ongoing climate crisis more effectively. Here are some of the key developments across different regions and sectors:\\n\\n### Global Initiatives\\n\\n1. **COP27 Outcomes** - The 27th Conference of the Parties (COP27) to the UNFCCC, held in Egypt in 2022, concluded with significant focus on adaptation, loss, and damage finance for vulnerable countries affected by climate change. Countries agreed to establish a \\loss and damage\\ fund, marking a historic decision.\\n\\n2. **Net-Zero Commitments** - More countries and corporations have pledged to achieve net-zero greenhouse gas (GHG) emissions by mid-century, aligning with the Paris Agreement\'s goal to limit global warming to well below 2 degrees Celsius above pre-industrial levels.\\n\\n3. **Renewable Energy Expansion** - There\'s a global push towards accelerating the deployment of renewable energy sources like solar and wind power to reduce reliance on fossil fuels.\\n\\n### Regional Developments\\n\\n1. **European Union** - The EU has been advancing its European Green Deal, aiming for climate neutrality by 2050. The \\Fit for 55\\ package proposes a set of interconnected measures designed to reduce net GHG emissions by at least 55% by 2030, compared to 1990 levels.\\n\\n2. **United States** - The U.S., under the Biden administration, rejoined the Paris Agreement and has been working on significant climate initiatives, including the Inflation Reduction Act of 2022, which includes substantial investments in clean energy and measures to reduce carbon emissions.\\n\\n3. **China** - China, as the world\'s largest emitter of GHGs, has committed to peaking carbon dioxide emissions before 2030 and achieving carbon neutrality before 2060. The country is investing heavily in renewable energy and electric vehicle production.\\n\\n4. **Developing Countries** - Many developing countries are implementing National Adaptation Plans (NAPs) and Nationally Determined Contributions (NDCs) under the Paris Agreement framework, focusing on sustainable development and resilience to climate impacts.\\n\\n### Sectoral Initiatives\\n\\n1. **Transportation** - Policies to promote electric vehicles (EVs), improve public transportation, and develop sustainable aviation and shipping practices are gaining traction.\\n\\n2. **Agriculture** - Efforts to improve the sustainability of agricultural practices, reduce methane emissions, and enhance food security in the face of climate change are underway.\\n\\n3. **Finance** - The Task Force on Climate-related Financial Disclosures (TCFD) guidelines for companies to disclose climate-related financial risks are being widely adopted, aiming to shift investments towards more sustainable ventures.\\n\\n### Challenges and Looking Forward\\n\\nDespite these developments, global GHG emissions continue to rise, highlighting the urgency for more ambitious action. The complexity of international negotiations, the need for substantial financial resources, and balancing economic development with environmental sustainability remain significant challenges.\\n\\nFuture policies will likely focus on enhancing climate adaptation and resilience, closing the gap between current commitments and the emissions reductions needed to meet Paris Agreement goals, and ensuring equitable and just transitions for communities impacted by climate change policies.\\n\\nPlease note that specific policies and their implementation status can evolve rapidly, and it\'s beneficial to consult up-to-date sources for the latest information.', '2024-02-26 17:11:00', 494, 0, NULL, 3, 3, NULL, NULL, '2024-02-26 06:10:56', '2024-02-26 06:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `constants`
--

CREATE TABLE `constants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int NOT NULL DEFAULT '0',
  `sub_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `constants`
--

INSERT INTO `constants` (`id`, `name`, `type`, `value`, `sequence`, `sub_type`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'veterinary', 'SYSTEM_SERVICE', 'Veterinary', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59', NULL),
(2, 'grooming', 'SYSTEM_SERVICE', 'Grooming', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59', NULL),
(3, 'boarding', 'SYSTEM_SERVICE', 'Boarding', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59', NULL),
(4, 'day_care', 'SYSTEM_SERVICE', 'Day Care', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(5, 'walking', 'SYSTEM_SERVICE', 'Walking', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(6, 'training', 'SYSTEM_SERVICE', 'Training', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(7, 'small', 'PET_SIZE', 'Small', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(8, 'large', 'PET_SIZE', 'Large', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(9, 'medium', 'PET_SIZE', 'Medium', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(10, 'cm', 'PET_HEIGHT_UNIT', 'CM', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(11, 'inch', 'PET_HEIGHT_UNIT', 'Inch', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(12, 'kg', 'PET_WEIGHT_UNIT', 'KG', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(13, 'lb', 'PET_WEIGHT_UNIT', 'Pound', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(14, 'Paid', 'PAYMENT_STATUS', '1', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(15, 'Pending', 'PAYMENT_STATUS', '0', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(16, 'cash', 'PAYMENT_METHODS', 'Cash', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(17, 'upi', 'PAYMENT_METHODS', 'UPI', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(18, 'razorpay', 'PAYMENT_METHODS', 'Razorpay', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(19, 'stripe', 'PAYMENT_METHODS', 'Stripe', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(20, 'unisex', 'BRANCH_SERVICE_GENDER', 'Unisex', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(21, 'female', 'BRANCH_SERVICE_GENDER', 'Female', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(22, 'male', 'BRANCH_SERVICE_GENDER', 'Male', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(23, '1', 'status', 'Active', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(24, '0', 'status', 'Deactive', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(25, 'pending', 'BOOKING_STATUS', 'Pending', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(26, 'confirmed', 'BOOKING_STATUS', 'Confirmed', 1, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(27, 'cancelled', 'BOOKING_STATUS', 'Cancelled', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(28, 'inprogress', 'BOOKING_STATUS', 'In Progress', 3, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(29, 'completed', 'BOOKING_STATUS', 'Completed', 4, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(30, 'rejected', 'BOOKING_STATUS', 'Rejected', 5, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(31, '#e5a900', 'BOOKING_STATUS_COLOR', 'Pending Color', 0, 'pending', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(32, '#6E6EEF', 'BOOKING_STATUS_COLOR', 'Confirm Color', 1, 'confirmed', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(33, '#D68AF1', 'BOOKING_STATUS_COLOR', 'Check In Color', 2, 'check_in', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(34, '#E58282', 'BOOKING_STATUS_COLOR', 'Check Out Color', 3, 'checkout', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(35, '#D1D1D1', 'BOOKING_STATUS_COLOR', 'Cancelled Color', 4, 'cancelled', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(36, '#3ABA61', 'BOOKING_STATUS_COLOR', 'Completed Color', 4, 'completed', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(37, 'Text', 'field_type', 'text', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(38, 'Textarea', 'field_type', 'textarea', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(39, 'Select', 'field_type', 'select', 3, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(40, 'Radio', 'field_type', 'radio', 4, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(41, 'Checkbox', 'field_type', 'checkbox', 5, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(42, 'English', 'language', 'en', 1, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(43, 'বাংলা', 'language', 'br', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(44, 'العربی', 'language', 'ar', 3, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(45, 'Vietnamese', 'language', 'vi', 4, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(46, 'Category', 'SLIDER_TYPES', 'category', 1, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(47, 'Service', 'SLIDER_TYPES', 'service', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(48, 'Cash', 'EARNING_PAYMENT_TYPE', 'cash', 1, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(49, 'Bank', 'EARNING_PAYMENT_TYPE', 'bank', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(50, 'Wallet', 'EARNING_PAYMENT_TYPE', 'wallet', 3, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(51, 'gallery', 'additional_permissions', 'Gallery', 1, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(52, 'password', 'additional_permissions', 'Password', 2, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(53, 'tableview', 'additional_permissions', 'Tableview', 3, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(54, 'review', 'additional_permissions', 'Review', 4, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(55, 'Change Password', 'notification_type', 'change_password', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(56, 'Forget Email/Password', 'notification_type', 'forget_email_password', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(57, 'ID', 'notification_param_button', 'id', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(58, 'Customer Name', 'notification_param_button', 'user_name', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(59, 'Description / Note', 'notification_param_button', 'description', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(60, 'Your Name', 'notification_param_button', 'logged_in_user_fullname', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(61, 'Your Position', 'notification_param_button', 'logged_in_user_role', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(62, 'Company Name', 'notification_param_button', 'company_name', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(63, 'Company Info', 'notification_param_button', 'company_contact_info', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(64, 'User\' ID', 'notification_param_button', 'user_id', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(65, 'User Password', 'notification_param_button', 'user_password', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(66, 'Link', 'notification_param_button', 'link', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(67, 'Site URL', 'notification_param_button', 'site_url', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(68, 'User', 'notification_to', 'user', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(69, 'Demo Admin', 'notification_to', 'demo_admin', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(70, 'Admin', 'notification_to', 'admin', 0, NULL, 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `no_of_decimal` int UNSIGNED NOT NULL,
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `is_primary`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Doller', '$', 'USD', 1, 'left', 2, ',', '.', NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customtemplates`
--

CREATE TABLE `customtemplates` (
  `id` bigint UNSIGNED NOT NULL,
  `template_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `package_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `inculde_voice_tone` tinyint(1) NOT NULL DEFAULT '1',
  `userinput_list` text COLLATE utf8mb4_unicode_ci,
  `option_data` text COLLATE utf8mb4_unicode_ci,
  `custom_prompt` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customtemplates`
--

INSERT INTO `customtemplates` (`id`, `template_name`, `description`, `category_id`, `package_id`, `status`, `inculde_voice_tone`, `userinput_list`, `option_data`, `custom_prompt`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Blog Conclusion', 'End your blog posts on a high note. Craft memorable conclusions that leave a lasting impact.', 1, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Title of the blog text\",\"description\":\"Enter Title of the blog text\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write blog post conclusion about title: ##INPUT-0##. And the description is ##INPUT-1##.Maximum ##INPUT-3## words. Creativity is  ##INPUT-5## between 0 and 1. Language is ##INPUT-2## US. Generate ##INPUT-4## different blog conclusions. Tone of voice must be ##INPUT-6##.', NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(2, 'Youtube Video Description', 'Elevate your YouTube content with compelling video descriptions. Generate engaging descriptions effortlessly and increase views.', 4, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, '\"Generate one paragraph about:  \'##INPUT-0## \'. Keywords are ##INPUT-1##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different paragraphs. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(3, 'Pros and Cons', 'Make informed decisions with ease. Generate unbiased pros and cons lists that help you weigh options and make better choices.', 2, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\"400 \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Generate pros & cons about title:  \'##INPUT-1##\'. Description is  ##INPUT-0##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different pros&cons. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(4, 'Google Ads Headlines', 'Create high-converting Google ads with captivating headlines. Generate unique, clickable ads that drive traffic and boost sales.', 3, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Product Name\",\"description\":\"Enter Product Name\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Audience\",\"description\":\"Select Audience\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Everyone\",\"description\":\"\",\"icon\":\" \",\"value\":\"Everyone\"},{\"title\":\"Woman\",\"description\":\"\",\"icon\":\" \",\"value\":\"Woman\"},{\"title\":\"Man\",\"description\":\"\",\"icon\":\" \",\"value\":\"Man\"},{\"title\":\"Children\",\"description\":\"\",\"icon\":\" \",\"value\":\"Children\"},{\"title\":\"Teenager\",\"description\":\"\",\"icon\":\" \",\"value\":\"Teenager\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":4,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":6,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":7,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-7##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write Google ads headline product name: ##INPUT-0##. Description is ##INPUT-1##. Audience is ##INPUT-2##. Maximum  ##INPUT-4##  words. Creativity is ##INPUT-6## between 0 and 1. Language is ##INPUT-3##. Generate ##INPUT-5## different google ads headlines. Tone of voice must be ##INPUT-7##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(5, 'Instagram Captions', 'Elevate your Instagram game with captivating captions. Generate unique captions that engage followers and increase your reach.', 4, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, '\"Generate one paragraph about:  \'##INPUT-0## \'. Keywords are ##INPUT-1##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different paragraphs. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(6, 'Meta Description', 'Get more clicks with compelling meta descriptions. Generate unique, SEO-friendly meta descriptions that attract customers and boost traffic.', 2, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Generate pros & cons about title:  \'##INPUT-1##\'. Description is  ##INPUT-0##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different pros&cons. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(7, 'Article Generator', 'Instantly create unique articles on any topic. Boost engagement, improve SEO, and save time.', 1, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Article Title\",\"description\":\"Enter Article Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Focus Keywords (Seperate with Comma)\",\"description\":\"Enter Focus Keywords (Seperate with Comma)\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Enter Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":0,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Generate article about ##INPUT-0##. Focus on ##INPUT-1##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is  ##INPUT-2## . Generate ##INPUT-4## different articles. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(8, 'Paragraph Generator', 'Generate a paragraph with keywords and description. Never struggle with writer\'s block again. Generate flawless paragraphs that captivate readers.', 1, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Keywords (Separate with comma.)\",\"description\":\"Enter Keywords (Separate with comma.)\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Generate one paragraph about:  ##INPUT-0## . Keywords are ##INPUT-1## . Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different paragraphs. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(9, 'Grammar Correction', 'Eliminate grammar errors and enhance your writing with ease. Our tool offers seamless grammar correction for flawless content.', 1, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Correct this to standard English US. Text is ##INPUT-0##. Maximum ##INPUT-2## words. Creativity is ##INPUT-4## between 0 and 1. Language is ##INPUT-1##. Generate ##INPUT-3## different grammar correction. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(10, 'TLDR Summarization', 'Automatically summarize long texts into bite-sized summaries with this TL;DR generator.', 1, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, '##INPUT-0## . Tl;dr Maximum ##INPUT-2##  words. Creativity is ##INPUT-4##  between 0 and 1. Language is ##INPUT-1##. Generate ##INPUT-3## different tl;dr. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(11, 'Google Ads Description', 'Step up your Google ad game, Craft high-converting ad copy that grabs attention and drives sales.', 3, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Product Name\",\"description\":\"Enter Product Name\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Audience\",\"description\":\"Select Audience\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Everyone\",\"description\":\"\",\"icon\":\" \",\"value\":\"Everyone\"},{\"title\":\"Woman\",\"description\":\"\",\"icon\":\" \",\"value\":\"Woman\"},{\"title\":\"Man\",\"description\":\"\",\"icon\":\" \",\"value\":\"Man\"},{\"title\":\"Children\",\"description\":\"\",\"icon\":\" \",\"value\":\"Children\"},{\"title\":\"Teenager\",\"description\":\"\",\"icon\":\" \",\"value\":\"Teenager\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":4,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":6,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":7,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-7##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write google ads description product name: ##INPUT-0##. Description is ##INPUT-1##. Audience is ##INPUT-2##. Maximum ##INPUT-5## words. Creativity is ##INPUT-6## between 0 and 1. Language is ##INPUT-3##. Generate ##INPUT-5## different google ads description. Tone of voice must be ##INPUT-7##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(12, 'Social Media Post Business', 'Generate a text for your business social media networks. Maximize your social media presence with impactful business posts.', 4, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Company Name\",\"description\":\"Enter Company Name\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Company Description\",\"description\":\"Enter Company Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write in company social media post, company name: ##INPUT-0##. About: ##INPUT-1##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different social media posts. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04');
INSERT INTO `customtemplates` (`id`, `template_name`, `description`, `category_id`, `package_id`, `status`, `inculde_voice_tone`, `userinput_list`, `option_data`, `custom_prompt`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(13, 'Facebook Headlines', 'Get noticed with attention-grabbing Facebook headlines. Generate unique, clickable headlines that increase engagement and drive traffic.', 4, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write Facebook ads title about title: ##INPUT-0##. And description is ##INPUT-1##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different facebook ads title. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(14, 'Social Media Post Tweet', 'Make an impact with every tweet. Generate attention-grabbing social media posts and increase engagement.', 4, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write in 1st person tweet about ##INPUT-0##. Maximum ##INPUT-2## words. Creativity is ##INPUT-4## between 0 and 1. Language is ##INPUT-1##. Generate ##INPUT-3## different tweets. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(15, 'FAQ Generator', 'Quickly create helpful FAQs. Our AI-powered generator provides custom responses to common questions in seconds.', 2, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Title\",\"description\":\"Enter Description\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\"  \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\"1 \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Enter Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Enter Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Answer like faq about subject: ##INPUT-1## Description is ##INPUT-0##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5##  between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4##  different faqs. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(16, 'Instagram Hashtags', 'Boost your Instagram reach with relevant hashtags. Generate optimal, trending hashtags and increase your visibility.', 4, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Keywords\",\"description\":\"Enter Keywords\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\"1 \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Enter Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Enter Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write instagram hastags for ##INPUT-0##. Maximum  ##INPUT-2##  words. Creativity is##INPUT-4##  between 0 and 1. Language is ##INPUT-1##. Generate ##INPUT-3##  different instagram hashtags. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(17, 'Testimonial Review', 'Instantly generate authentic testimonials. Build trust and credibility with genuine reviews.', 4, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Subject\",\"description\":\"Enter Subject\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian \",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\" Professional\"},{\"title\":\" Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\" Funny\"},{\"title\":\" Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\" Casual\"},{\"title\":\" Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\" Excited\"},{\"title\":\" Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\" Witty\"},{\"title\":\" Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\" Sarcastic\"},{\"title\":\" Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Feminine\"},{\"title\":\" Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\" Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Generate testimonial for ##INPUT-0##. Include details about how it helped you and what you like best about it. Be honest and specific, and feel free to get creative with your wording Maximum ##INPUT-2##  words. Creativity is ##INPUT-4##  between 0 and 1. Language is ##INPUT-1## . Generate ##INPUT-3## different testimonials. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(18, 'Email Generator', 'Generate an email with your subject and description. Streamline your inbox and save time.', 2, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Subject of Email\",\"description\":\"Enter Subject of Email\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":3,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\" Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\" Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\" Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\" Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":6,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'Write email about title: ##INPUT-1##, description: ##INPUT-0##. Maximum ##INPUT-3## words. Creativity is ##INPUT-5## between 0 and 1. Language is ##INPUT-2##. Generate ##INPUT-4## different emails. Tone of voice must be ##INPUT-6##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(19, 'Email Answer Generator', 'Effortlessly tackle your overflowing inbox with custom, accurate responses to common queries, freeing you up to focus on what matters most.', 2, 2, 1, 1, '[{\"index\":0,\"input_title\":\"Description \",\"description\":\"Enter Description \",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":2,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":4,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":5,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'answer this email content: ##INPUT-0##. Maximum ##INPUT-2## words. Creativity is ##INPUT-4## between 0 and 1. Language is ##INPUT-1##. Generate ##INPUT-3## different email answers. Tone of voice must be ##INPUT-5##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(20, 'Newsletter Generator', 'Generate engaging newsletters easily with personalized content that resonates with your audience, driving growth and engagement.', 3, 1, 1, 1, '[{\"index\":0,\"input_title\":\"Description\",\"description\":\"Enter Description\",\"input_type\":\"textarea\",\"input_tag\":\"##INPUT-0##\",\"is_required\":1,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":1,\"input_title\":\"Title\",\"description\":\"Enter Title\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-1##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":2,\"input_title\":\"Subject\",\"description\":\"Enter Subject\",\"input_type\":\"text_input\",\"input_tag\":\"##INPUT-2##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":3,\"input_title\":\"Language\",\"description\":\"Select Language\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-3##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"English\",\"description\":\"\",\"icon\":\" \",\"value\":\"English\"},{\"title\":\"Arabic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Arabic\"},{\"title\":\"Dutch\",\"description\":\"\",\"icon\":\" \",\"value\":\"Dutch\"},{\"title\":\"French\",\"description\":\"\",\"icon\":\" \",\"value\":\"French\"},{\"title\":\"Italian\",\"description\":\"\",\"icon\":\" \",\"value\":\"Italian\"},{\"title\":\"Spanish\",\"description\":\"\",\"icon\":\" \",\"value\":\"Spanish\"}],\"selected\":\"single_select\"},{\"index\":4,\"input_title\":\"Maximum Length\",\"description\":\"Enter Maximum Length\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-4##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 400\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":5,\"input_title\":\"Number of Results\",\"description\":\"Enter Number of Results\",\"input_type\":\"number_input\",\"input_tag\":\"##INPUT-5##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" 1\",\"option_data\":[{\"title\":\"\",\"description\":\"\",\"icon\":\"\"}]},{\"index\":6,\"input_title\":\"Creativity\",\"description\":\"Select Creativity\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-6##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Economic\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.25\"},{\"title\":\"Average\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.5\"},{\"title\":\"Good\",\"description\":\"\",\"icon\":\" \",\"value\":\"0.75\"},{\"title\":\"Premium\",\"description\":\"\",\"icon\":\" \",\"value\":\"1\"}],\"selected\":\"single_select\"},{\"index\":7,\"input_title\":\"Tone of Voice\",\"description\":\"Select Tone of Voice\",\"input_type\":\"single_select\",\"input_tag\":\"##INPUT-7##\",\"is_required\":1,\"package_id\":null,\"default_value\":\" \",\"option_data\":[{\"title\":\"Professional\",\"description\":\"\",\"icon\":\" \",\"value\":\"Professional\"},{\"title\":\"Funny\",\"description\":\"\",\"icon\":\" \",\"value\":\"Funny\"},{\"title\":\"Casual\",\"description\":\"\",\"icon\":\" \",\"value\":\"Casual\"},{\"title\":\"Excited\",\"description\":\"\",\"icon\":\" \",\"value\":\"Excited\"},{\"title\":\"Witty\",\"description\":\"\",\"icon\":\" \",\"value\":\"Witty\"},{\"title\":\"Sarcastic\",\"description\":\"\",\"icon\":\" \",\"value\":\"Sarcastic\"},{\"title\":\"Feminine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Feminine\"},{\"title\":\"Masculine\",\"description\":\"\",\"icon\":\" \",\"value\":\"Masculine\"}],\"selected\":\"single_select\"}]', NULL, 'generate newsletter template about product_title: ##INPUT-1##, reason: ##INPUT-2## description: ##INPUT-0##. Maximum ##INPUT-4## words. Creativity is ##INPUT-6## between 0 and 1. Language is ##INPUT-3##. Generate ##INPUT-5## different newsletter template. Tone of voice must be ##INPUT-7##', NULL, NULL, NULL, NULL, '2024-06-15 04:45:04', '2024-06-15 04:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_group_id` int DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint NOT NULL DEFAULT '0',
  `values` text COLLATE utf8mb4_unicode_ci,
  `is_export` int DEFAULT '0',
  `visible` enum('true','false') COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  `is_view` int DEFAULT '0',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `name`, `model`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Customer / Employee', 'App\\Models\\User', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Plan', 'Modules\\Subscriptions\\Models\\Plan', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_data` longtext COLLATE utf8mb4_unicode_ci,
  `word_count` int NOT NULL,
  `image_count` int NOT NULL,
  `template_id` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `user_id`, `type`, `history_data`, `word_count`, `image_count`, `template_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'ai_art_generator', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"dall-e-3\\\",\\\"prompt\\\":\\\"Generate an Art Image. Style Sketch. A vibrant image with a contemporary art style and soft focus lighting, evoking a cheerful mood.\\\",\\\"n\\\":1,\\\"size\\\":\\\"1024x1024\\\"},\\\"response_body\\\":{\\\"created\\\":1708945763,\\\"data\\\":[{\\\"revised_prompt\\\":\\\"Create a sketch-style image emanating a vibrant and cheerful mood. The art should have the aesthetics of contemporary art that existed prior to 1912, utilizing soft focus lighting. Capture different shades of vibrance and liven the picture with an array of colors while maintaining the sketch-like consistency. It should convey a sense of cheerfulness and energy through the use of color, light, and lines.\\\",\\\"url\\\":\\\"https:\\/\\/oaidalleapiprodscus.blob.core.windows.net\\/private\\/org-er60iME99e9QXAOg1Q6X456b\\/user-0jwxYsMWlxP29plOh6qPbwhf\\/img-EbzNGol0mde46zfr7pjOj4cT.png?st=2024-02-26T10%3A09%3A23Z&se=2024-02-26T12%3A09%3A23Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image\\/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-02-26T00%3A22%3A32Z&ske=2024-02-27T00%3A22%3A32Z&sks=b&skv=2021-08-06&sig=ggPsM1ii2O1m%2BCIDYlMuzQuAiH3rEosNUgibJi37jVU%3D\\\"}]}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-01-15 05:39:11', '2024-01-15 05:39:11'),
(2, 3, 'ai_art_generator', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"dall-e-3\\\",\\\"prompt\\\":\\\"Generate an Art Image. Style Nature. An anime-style illustration featuring bold colors and dramatic lighting, conveying an aggressive mood.\\\",\\\"n\\\":1,\\\"size\\\":\\\"1024x1792\\\"},\\\"response_body\\\":{\\\"created\\\":1708945877,\\\"data\\\":[{\\\"revised_prompt\\\":\\\"Create an image in the nature style. Include an anime-influenced illustration characterized by bold, vibrant colors and dramatic lighting that evokes a sense of aggression. This scene should encompass strong emotions and energy.\\\",\\\"url\\\":\\\"https:\\/\\/oaidalleapiprodscus.blob.core.windows.net\\/private\\/org-er60iME99e9QXAOg1Q6X456b\\/user-0jwxYsMWlxP29plOh6qPbwhf\\/img-BNZlOyKj28BXskvyQKKmj8en.png?st=2024-02-26T10%3A11%3A17Z&se=2024-02-26T12%3A11%3A17Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image\\/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-02-26T05%3A10%3A01Z&ske=2024-02-27T05%3A10%3A01Z&sks=b&skv=2021-08-06&sig=NXifrpov9RHlSGql58tI4Zw5CYuNM3pCRYJnGwegi8Y%3D\\\"}]}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-01-26 05:42:06', '2024-01-26 05:42:06'),
(3, 3, 'ai_art_generator', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"dall-e-3\\\",\\\"prompt\\\":\\\"Generate an Art Image. Style History. A minimalist graphic with a pixel art style and blue hour lighting, creating a calming atmosphere.\\\",\\\"n\\\":1,\\\"size\\\":\\\"1792x1024\\\"},\\\"response_body\\\":{\\\"created\\\":1708946179,\\\"data\\\":[{\\\"revised_prompt\\\":\\\"Create a minimalist image that encapsulates the spirit of history. The piece should be designed in a pixel art style, with the predominant color scheme reflecting blue hour lighting. The arrangement and composition of the minimal elements should resonate a sense of calm and tranquility.\\\",\\\"url\\\":\\\"https:\\/\\/oaidalleapiprodscus.blob.core.windows.net\\/private\\/org-er60iME99e9QXAOg1Q6X456b\\/user-0jwxYsMWlxP29plOh6qPbwhf\\/img-kUC6TegcTGoein3EPNw4isAo.png?st=2024-02-26T10%3A16%3A19Z&se=2024-02-26T12%3A16%3A19Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image\\/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-02-26T08%3A59%3A05Z&ske=2024-02-27T08%3A59%3A05Z&sks=b&skv=2021-08-06&sig=C21PRtpKk4JuADsqk7wL2aTW9xMId8%2Bg89UuXrgHOPQ%3D\\\"}]}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-02-26 05:47:43', '2024-02-26 05:47:43'),
(5, 3, 'ai_art_generator', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"dall-e-3\\\",\\\"prompt\\\":\\\"Generate an Art Image. Style Sketch. A vector-based design with a modern aesthetic and neon lighting, exuding a futuristic vibe.\\\",\\\"n\\\":1,\\\"size\\\":\\\"1024x1024\\\"},\\\"response_body\\\":{\\\"created\\\":1708946734,\\\"data\\\":[{\\\"revised_prompt\\\":\\\"Please create an image inspired by a sketch style. The design should lean towards vector art combined with a modern aesthetic. The scene should incorporate neon lighting to exude a futuristic feeling. The elements included in the design should reflect this futuristic vibe. Please make sure the image radiates a sense of being in an innovative, high-tech future with the use of vibrant and glowing neon colors.\\\",\\\"url\\\":\\\"https:\\/\\/oaidalleapiprodscus.blob.core.windows.net\\/private\\/org-er60iME99e9QXAOg1Q6X456b\\/user-0jwxYsMWlxP29plOh6qPbwhf\\/img-jGiJcqcec9oKyB2BUoZZo3L3.png?st=2024-02-26T10%3A25%3A34Z&se=2024-02-26T12%3A25%3A34Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image\\/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-02-25T20%3A46%3A43Z&ske=2024-02-26T20%3A46%3A43Z&sks=b&skv=2021-08-06&sig=xUILC8dEMYfVk\\/v5t3jebDU7jIdvRsdQJrfV\\/Z3acmc%3D\\\"}]}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-02-26 05:55:03', '2024-02-26 05:55:03'),
(6, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Please exploring the impact of blockchain technology on the finance industry.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Exploring Blockchain Technology\'s Revolutionary Impact on Finance\\\",\\\"created_at\\\":\\\"\\\"}}\"', 521, 0, 0, 3, 3, NULL, NULL, '2024-01-10 05:59:00', '2024-01-10 05:59:00'),
(7, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"What is the future of autonomous vehicles and their potential societal implications?\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":2,\\\"user_id\\\":3,\\\"title\\\":\\\"New Chat\\\",\\\"created_at\\\":\\\"2024-02-26T11:29:25.000000Z\\\"}}\"', 402, 0, 0, 3, 3, NULL, NULL, '2024-01-15 06:00:02', '2024-01-15 06:00:02'),
(8, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Please exploring the impact of blockchain technology on the finance industry.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Exploring Blockchain\'s Revolutionary Impact on Finance\\\",\\\"created_at\\\":\\\"\\\"}}\"', 466, 0, 0, 3, 3, NULL, NULL, '2024-02-15 06:00:56', '2024-02-15 06:00:56'),
(9, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Hello there \\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Engaging Conversation Initiation with GPT Model\\\",\\\"created_at\\\":\\\"\\\"}}\"', 7, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:02:09', '2024-02-26 06:02:09'),
(10, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Exploring the impact of blockchain technology on the finance industry.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":5,\\\"user_id\\\":3,\\\"title\\\":\\\"New Chat\\\",\\\"created_at\\\":\\\"2024-02-26T11:33:05.000000Z\\\"}}\"', 490, 0, 0, 3, 3, NULL, NULL, '2024-01-26 06:03:44', '2024-01-26 06:03:44'),
(11, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Exploring the impact of blockchain technology on the finance industry.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":6,\\\"user_id\\\":3,\\\"title\\\":\\\"New Chat\\\",\\\"created_at\\\":\\\"2024-02-26T11:33:28.000000Z\\\"}}\"', 501, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:04:10', '2024-02-26 06:04:10'),
(12, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"What is the future of autonomous vehicles and their potential societal implications?\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Exploring the Future of Autonomous Vehicles and Their Impact\\\",\\\"created_at\\\":\\\"\\\"}}\"', 407, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:04:40', '2024-02-26 06:04:40'),
(13, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Examining the role of big data analytics in shaping healthcare outcomes and patient care strategies.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Impact of Big Data Analytics on Healthcare Outcomes and Strategies\\\",\\\"created_at\\\":\\\"\\\"}}\"', 464, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:06:41', '2024-02-26 06:06:41'),
(14, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Discussing Flutter\'s hot reload feature and its impact on app development efficiency.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Exploring Flutter\'s Hot Reload: A Revolution in App Development\\\",\\\"created_at\\\":\\\"\\\"}}\"', 489, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:08:24', '2024-02-26 06:08:24'),
(15, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\" What is the outlook for global economic recovery post-pandemic?\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Navigating Post-Pandemic Global Economic Recovery: Outlook & Challenges\\\",\\\"created_at\\\":\\\"\\\"}}\"', 391, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:10:04', '2024-02-26 06:10:04'),
(16, 3, 'ai_chat', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant. Your Name is Intellij AI. if Someone asks about your name or identity related question reply i am Intellij AI nice to meet you whats your name.....\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"What are the latest developments in climate change policies?\\\"}],\\\"stream\\\":true},\\\"response_body\\\":{\\\"id\\\":-1,\\\"user_id\\\":-1,\\\"title\\\":\\\"Recent Advances in Global Climate Change Policies and Initiatives\\\",\\\"created_at\\\":\\\"\\\"}}\"', 494, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:10:57', '2024-02-26 06:10:57'),
(17, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/58\\/slfQF3JlaQNgdB1HmK93TeyZOM65ATqzc7vS9dsH.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"woman_cooking_in_kitchen.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/58\\/slfQF3JlaQNgdB1HmK93TeyZOM65ATqzc7vS9dsH.png\\\",\\\"tags\\\":[\\\"woman\\\",\\\"cooking\\\",\\\"kitchen\\\",\\\"chopping vegetables\\\",\\\"healthy eating\\\",\\\"red sweater\\\",\\\"stove\\\",\\\"pasta\\\",\\\"smiling\\\",\\\"preparing food\\\",\\\"indoor\\\",\\\"modern kitchen\\\"],\\\"description\\\":\\\"A woman in a red sweater is smiling while chopping vegetables on a white cutting board in a modern kitchen. There is a pot on the stove with pasta sticking out, suggesting she is in the process of preparing a meal. The kitchen is well-lit and features contemporary appliances and a backsplash.\\\"}}\"', 77, 0, 0, 3, 3, NULL, NULL, '2024-01-26 06:18:17', '2024-01-26 06:18:17'),
(18, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/59\\/jjGwVLbADI1B8jMnyMxpH08sEPe0SGjhtM6fBgnp.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"hair-coloring-at-salon.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/59\\/jjGwVLbADI1B8jMnyMxpH08sEPe0SGjhtM6fBgnp.png\\\",\\\"tags\\\":[\\\"hair salon\\\",\\\"hair coloring\\\",\\\"foil\\\",\\\"hair highlights\\\",\\\"beauty treatment\\\",\\\"hairdresser\\\",\\\"woman\\\",\\\"hair care\\\"],\\\"description\\\":\\\"A woman receiving hair coloring treatment at a salon where her hair is being highlighted using foil. The image shows a close-up of a hairstylist\'s hands holding a comb and applying the hair color to strands of the woman\'s hair, which is sectioned with the foil.\\\"}}\"', 67, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:19:09', '2024-02-26 06:19:09'),
(19, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/60\\/tK8xBM4U6tYE3VdEZrWAXElrRuuTLld3S2VPoN3G.jpg\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"pastry_chef_decorating_cake.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/60\\/tK8xBM4U6tYE3VdEZrWAXElrRuuTLld3S2VPoN3G.jpg\\\",\\\"tags\\\":[\\\"pastry chef\\\",\\\"cake\\\",\\\"decorating\\\",\\\"kitchen\\\",\\\"confectionery\\\",\\\"dessert\\\",\\\"chocolate\\\",\\\"bakery\\\",\\\"food preparation\\\",\\\"apron\\\"],\\\"description\\\":\\\"A pastry chef with a bun hairstyle is meticulously decorating a cake with chocolate and nuts. She is wearing a white shirt and a purple apron, and the setting appears to be a professional kitchen.\\\"}}\"', 55, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:20:46', '2024-02-26 06:20:46'),
(20, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/61\\/bqcr2QiJOJkOCf6rbih45Ko6snA84OxjUdnFRb7s.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"plumber_working_under_sink.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/61\\/bqcr2QiJOJkOCf6rbih45Ko6snA84OxjUdnFRb7s.png\\\",\\\"tags\\\":[\\\"plumber\\\",\\\"sink\\\",\\\"repair\\\",\\\"wrench\\\",\\\"workwear\\\",\\\"plumbing\\\",\\\"maintenance\\\",\\\"man\\\",\\\"indoors\\\"],\\\"description\\\":\\\"A man in a blue uniform and cap is working on repairing the plumbing under a sink using an adjustable wrench.\\\"}}\"', 40, 0, 0, 3, 3, NULL, NULL, '2024-01-26 06:21:42', '2024-01-26 06:21:42'),
(21, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/62\\/AzaS5L3ecYfhI0310IRjf1Fq8rtDtmreOK1K3oQ2.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"electrician_installing_outlet.png\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/62\\/AzaS5L3ecYfhI0310IRjf1Fq8rtDtmreOK1K3oQ2.png\\\",\\\"tags\\\":[\\\"electrician\\\",\\\"wiring\\\",\\\"safety helmet\\\",\\\"tools\\\",\\\"electrical outlet\\\",\\\"installation\\\",\\\"construction\\\",\\\"white bricks\\\",\\\"working\\\",\\\"wall\\\"],\\\"description\\\":\\\"A person wearing a safety helmet and glasses is installing an electrical outlet on a white brick wall. The electrician is using a screwdriver and appears to be focused on his work, with various tools attached to his belt.\\\"}}\"', 62, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:23:17', '2024-02-26 06:23:17'),
(22, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/63\\/ngV4zmxRPn4BfzllQT0GKwTQ0XJBuq3Wr8jkAjob.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"electrician_installing_outlet.png\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/63\\/ngV4zmxRPn4BfzllQT0GKwTQ0XJBuq3Wr8jkAjob.png\\\",\\\"tags\\\":[\\\"electrician\\\",\\\"installation\\\",\\\"safety helmet\\\",\\\"wiring\\\",\\\"outlet\\\",\\\"tools\\\",\\\"wall\\\",\\\"construction\\\",\\\"worker\\\",\\\"handiwork\\\",\\\"indoor\\\"],\\\"description\\\":\\\"An electrician in a safety helmet and glasses is installing an electrical outlet on a white brick wall. He is focused on his work, using a screwdriver and handling wires. He is equipped with a tool belt containing various tools and wearing casual work clothing.\\\"}}\"', 65, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:23:19', '2024-02-26 06:23:19'),
(24, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/65\\/BVFxmBGOoJx456EiCq3UsSuKIgeWKAZpYmwXy0mv.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"office_cleaning_staff_at_work.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/65\\/BVFxmBGOoJx456EiCq3UsSuKIgeWKAZpYmwXy0mv.png\\\",\\\"tags\\\":[\\\"office\\\",\\\"cleaning\\\",\\\"janitors\\\",\\\"plants\\\",\\\"vacuum cleaner\\\",\\\"cleaning equipment\\\",\\\"work environment\\\",\\\"windows\\\",\\\"office chairs\\\",\\\"desks\\\",\\\"professional cleaners\\\"],\\\"description\\\":\\\"Two professional cleaners working in an office environment. A woman in overalls and yellow gloves is dusting a potted plant on a desk, while a man in similar attire is vacuuming the floor with a yellow industrial vacuum cleaner. The office is spacious with large windows, multiple desks and ergonomic office chairs, suggesting a professional and tidy workspace.\\\"}}\"', 82, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:31:52', '2024-02-26 06:31:52'),
(25, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/66\\/9Xg9ZXzb6e25I6KgxQUErANv5r9hl7ytKQzSbUcT.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"office_cleaning_staff_at_work.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/66\\/9Xg9ZXzb6e25I6KgxQUErANv5r9hl7ytKQzSbUcT.png\\\",\\\"tags\\\":[\\\"office\\\",\\\"cleaning\\\",\\\"janitorial staff\\\",\\\"male\\\",\\\"female\\\",\\\"vacuum cleaner\\\",\\\"dusting\\\",\\\"workplace\\\",\\\"indoor\\\",\\\"plants\\\",\\\"desks\\\",\\\"office chairs\\\",\\\"windows\\\"],\\\"description\\\":\\\"A male and female cleaning staff working in an office environment. The woman is dusting a plant next to an office desk while wearing yellow cleaning gloves, and the man is using a vacuum cleaner to clean the carpeted floor. The office is equipped with modern furniture including desks, office chairs, and computers, and has large windows that provide natural light.\\\"}}\"', 85, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:32:11', '2024-02-26 06:32:11'),
(26, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/67\\/LiZI91kn6STNIwp7jqZiiKm7cs7oFkxP6wDAlKz8.png\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"artist_painting_outdoors.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/67\\/LiZI91kn6STNIwp7jqZiiKm7cs7oFkxP6wDAlKz8.png\\\",\\\"tags\\\":[\\\"artist\\\",\\\"painting\\\",\\\"outdoors\\\",\\\"easel\\\",\\\"palette\\\",\\\"creative\\\",\\\"nature\\\",\\\"art\\\",\\\"landscape\\\",\\\"canvas\\\"],\\\"description\\\":\\\"A thoughtful artist holding a palette and brush, standing in front of an easel with a vibrant landscape painting, surrounded by lush greenery.\\\"}}\"', 41, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:32:31', '2024-02-26 06:32:31'),
(27, 3, 'ai_image_text', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-vision-preview\\\",\\\"max_tokens\\\":1600,\\\"messages\\\":[{\\\"role\\\":\\\"user\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Analyze the provided image and generate the tags, description, and image_name in the following JSON format:\\\\n{\\\\n  \\\\\\\"image_name\\\\\\\": \\\\\\\"\\\\\\\",\\\\n  \\\\\\\"tags\\\\\\\": [],\\\\n  \\\\\\\"description\\\\\\\": \\\\\\\"\\\\\\\"\\\\n}\\\\n\\\"},{\\\"type\\\":\\\"image_url\\\",\\\"image_url\\\":{\\\"url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/68\\/C7k8PjYyGZJWNGj7xLOvvIcquWaSdXdo97pWhJy5.jpg\\\",\\\"detail\\\":\\\"high\\\"}}]}]},\\\"response_body\\\":{\\\"image_name\\\":\\\"mexican_food_spread.jpg\\\",\\\"req_image_url\\\":\\\"https:\\/\\/client2.intellijai.net\\/service\\/vision-ai\\/public\\/storage\\/68\\/C7k8PjYyGZJWNGj7xLOvvIcquWaSdXdo97pWhJy5.jpg\\\",\\\"tags\\\":[\\\"Mexican food\\\",\\\"tacos\\\",\\\"quesadillas\\\",\\\"guacamole\\\",\\\"salsa\\\",\\\"nachos\\\",\\\"ceviche\\\",\\\"chili peppers\\\",\\\"lime\\\",\\\"avocado\\\",\\\"jalapeno\\\",\\\"tequila\\\",\\\"tortilla chips\\\",\\\"beans\\\",\\\"cheese\\\",\\\"corn\\\",\\\"cuisine\\\",\\\"beverages\\\",\\\"appetizers\\\",\\\"main course\\\"],\\\"description\\\":\\\"An array of Mexican cuisine including soft tacos filled with beans and vegetables, hard shell tacos with meat, a plate of quesadillas, a bowl of guacamole with a side of salsa, and nachos topped with diced vegetables. Additionally, there is a bowl of ceviche with shrimp, various side dishes including chili peppers and lime, an open avocado, jalapeno slices, and a shot glass of tequila. The spread represents a vibrant and colorful display of Mexican culinary offerings.\\\"}}\"', 111, 0, 0, 3, 3, NULL, NULL, '2024-02-26 06:33:46', '2024-02-26 06:33:46'),
(28, 3, 'ai_code', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"language python\\\\n\\\\nGenerate Code\\\\n\\\\nDevelop an AI program to automate data preprocessing tasks for machine learning models using Python\'s pandas library.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Creating an AI program to automate data preprocessing tasks for machine learning models involves several steps, including data cleaning, normalization or standardization, handling missing values, and encoding categorical variables. Below is a Python program that uses pandas to achieve this automation. Note that this is a foundational example, and real-world datasets may require more specific preprocessing steps.\\\\\\\\n\\\\\\\\n```python\\\\\\\\nimport pandas as pd\\\\\\\\nfrom sklearn.preprocessing import StandardScaler, OneHotEncoder\\\\\\\\nfrom sklearn.compose import ColumnTransformer\\\\\\\\nfrom sklearn.pipeline import Pipeline\\\\\\\\nfrom sklearn.impute import SimpleImputer\\\\\\\\n\\\\\\\\nclass AutoPreprocessor:\\\\\\\\n    def __init__(self, numeric_features, categorical_features):\\\\\\\\n        \\\\\\\\        :param numeric_features: List of names of numeric columns to be included in the preprocessing.\\\\\\\\n        :param categorical_features: List of names of categorical columns to be included in the preprocessing.\\\\\\\\n        \\\\\\\\        self.numeric_features = numeric_features\\\\\\\\n        self.categorical_features = categorical_features\\\\\\\\n        self.preprocessor = None\\\\\\\\n        self._create_preprocessor()\\\\\\\\n\\\\\\\\n    def _create_preprocessor(self):\\\\\\\\n        \\\\\\\\        Create a preprocessing pipeline.\\\\\\\\n        \\\\\\\\        # Numeric features pipeline\\\\\\\\n        numeric_transformer = Pipeline(steps=[\\\\\\\\n            (\'imputer\', SimpleImputer(strategy=\'mean\')),\\\\\\\\n            (\'scaler\', StandardScaler())\\\\\\\\n        ])\\\\\\\\n\\\\\\\\n        # Categorical features pipeline\\\\\\\\n        categorical_transformer = Pipeline(steps=[\\\\\\\\n            (\'imputer\', SimpleImputer(strategy=\'most_frequent\')),\\\\\\\\n            (\'onehot\', OneHotEncoder(handle_unknown=\'ignore\'))\\\\\\\\n        ])\\\\\\\\n\\\\\\\\n        # Combine both pipelines\\\\\\\\n        self.preprocessor = ColumnTransformer(\\\\\\\\n            transformers=[\\\\\\\\n                (\'num\', numeric_transformer, self.numeric_features),\\\\\\\\n                (\'cat\', categorical_transformer, self.categorical_features)\\\\\\\\n            ])\\\\\\\\n\\\\\\\\n    def fit(self, X):\\\\\\\\n        \\\\\\\\        Fit the preprocessor to the data.\\\\\\\\n        \\\\\\\\        self.preprocessor.fit(X)\\\\\\\\n\\\\\\\\n    def transform(self, X):\\\\\\\\n        \\\\\\\\        Transform the data with the fitted preprocessor.\\\\\\\\n        \\\\\\\\        return self.preprocessor.transform(X)\\\\\\\\n\\\\\\\\n    def fit_transform(self, X):\\\\\\\\n        \\\\\\\\        Fit the preprocessor to the data and then transform the data.\\\\\\\\n        \\\\\\\\        return self.preprocessor.fit_transform(X)\\\\\\\\n\\\\\\\\n# Example usage\\\\\\\\nif __name__ == \\\\\\\\main__\\\\\\\\    # Load your data\\\\\\\\n    # For example purposes, we\'re creating a simple DataFrame\\\\\\\\n    sample_data = {\\\\\\\\n        \'Age\': [25, 27, 29, 31, np.nan],\\\\\\\\n        \'Salary\': [50000, 54000, 50000, np.nan, 58000],\\\\\\\\n        \'Gender\': [\'Male\', \'Female\', \'Female\', \'Male\', \'Male\']\\\\\\\\n    }\\\\\\\\n    df = pd.DataFrame(sample_data)\\\\\\\\n\\\\\\\\n    # Specify your numeric and categorical features\\\\\\\\n    numeric_features = [\'Age\', \'Salary\']\\\\\\\\n    categorical_features = [\'Gender\']\\\\\\\\n\\\\\\\\n    # Initialize the AutoPreprocessor\\\\\\\\n    preprocessor = AutoPreprocessor(numeric_features=numeric_features, categorical_features=categorical_features)\\\\\\\\n\\\\\\\\n    # Fit and transform your data\\\\\\\\n    processed_data = preprocessor.fit_transform(df)\\\\\\\\n\\\\\\\\n    # Convert the processed data back to a DataFrame (optional)\\\\\\\\n    # Note: This step requires additional code to handle the transformed feature names for categorical variables.\\\\\\\\n    print(processed_data)\\\\\\\\n```\\\\\\\\n\\\\\\\\n**Note**: The generated code assumes that you\'re somewhat familiar with scikit-learn\'s preprocessing tools (`StandardScaler`, `SimpleImputer`, `OneHotEncoder`) and the `Pipeline` and `ColumnTransformer` utilities for chaining together multiple preprocessing steps. The example `sample_data` is quite basic; real datasets often require more nuanced handling. Also, after transformation, especially with OneHotEncoder, you might need additional steps to handle the transformed feature names for categorical variables if you desire to convert the output back into a pandas DataFrame.\\\"}\"', 382, 0, 9999999, 3, 3, NULL, NULL, '2024-01-26 06:57:50', '2024-01-26 06:57:50'),
(29, 3, 'ai_code', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"language javascript\\\\n\\\\nGenerate Code\\\\n\\\\nCreate an AI-powered chatbot capable of natural language understanding and sentiment analysis using Node.js and TensorFlow.js.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Creating an AI-powered chatbot that includes natural language understanding (NLU) and sentiment analysis using Node.js and TensorFlow.js involves several steps, including setting up your project environment, integrating TensorFlow.js for machine learning capabilities, and applying NLU and sentiment analysis models.\\\\\\\\n\\\\\\\\nBelow is a simplified example of how you could start building such a chatbot. Note that a full implementation would require more effort, integration with more comprehensive training data, and possibly additional libraries for improved natural language processing capabilities.\\\\\\\\n\\\\\\\\n### Step 1: Setting Up Your Project\\\\\\\\n\\\\\\\\n1. **Initialize a new Node.js project:**\\\\\\\\n\\\\\\\\nFirst, create a new directory for your project and initialize it with npm:\\\\\\\\n\\\\\\\\n```bash\\\\\\\\nmkdir ai_chatbot\\\\\\\\ncd ai_chatbot\\\\\\\\nnpm init -y\\\\\\\\n```\\\\\\\\n\\\\\\\\n2. **Install dependencies:**\\\\\\\\n\\\\\\\\nYou will need TensorFlow.js for machine learning models and @tensorflow-models\\/toxicity for sentiment analysis.\\\\\\\\n\\\\\\\\n```bash\\\\\\\\nnpm install @tensorflow\\/tfjs @tensorflow-models\\/toxicity\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Step 2: Creating the Chatbot\\\\\\\\n\\\\\\\\nCreate a file named `chatbot.js` in your project directory:\\\\\\\\n\\\\\\\\n```bash\\\\\\\\ntouch chatbot.js\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Step 3: Implementing the Chatbot Logic\\\\\\\\n\\\\\\\\nIn `chatbot.js`, you\'ll need to load TensorFlow.js and the toxicity model for sentiment analysis. Below is an example of how to implement basic sentiment analysis with the toxicity model.\\\\\\\\n\\\\\\\\n```javascript\\\\\\\\nconst tf = require(\'@tensorflow\\/tfjs\');\\\\\\\\nconst toxicity = require(\'@tensorflow-models\\/toxicity\');\\\\\\\\n\\\\\\\\n\\/\\/ Load the toxicity model\\\\\\\\nconst threshold = 0.9; \\/\\/ Threshold for classifying something as toxic. Adjust according to needs.\\\\\\\\ntoxicity.load(threshold).then(model => {\\\\\\\\n    const chatbot = async (message) => {\\\\\\\\n        const predictions = await model.classify([message]);\\\\\\\\n        const isToxic = predictions.some(result => result.results.some(r => r.match));\\\\\\\\n\\\\\\\\n        \\/\\/ Just a basic response logic\\\\\\\\n        if(isToxic) {\\\\\\\\n            console.log(\\\\\\\\The message might be considered offensive or inappropriate.\\\\\\\\        } else {\\\\\\\\n            console.log(\\\\\\\\The message seems fine.\\\\\\\\        }\\\\\\\\n    };\\\\\\\\n\\\\\\\\n    \\/\\/ Mock chat\\\\\\\\n    chatbot(\\\\\\\\I hate you\\\\\\\\    chatbot(\\\\\\\\I love sunny days\\\\\\\\});\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Step 4: Running Your Chatbot\\\\\\\\n\\\\\\\\nExecute your chatbot script with Node.js:\\\\\\\\n\\\\\\\\n```bash\\\\\\\\nnode chatbot.js\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Extending Functionality\\\\\\\\n\\\\\\\\nThis example showcases basic sentiment analysis but doesn\'t include detailed natural language understanding or a sophisticated chat interface. Further development could involve the following:\\\\\\\\n\\\\\\\\n- Integrating with dialogue management frameworks such as Microsoft Bot Framework or Dialogflow for more comprehensive NLU capabilities.\\\\\\\\n- Enhancing response logic based on conversation context and user sentiment.\\\\\\\\n- Training custom models with TensorFlow.js for specific NLU tasks relevant to your chatbot use case.\\\\\\\\n- Implementing more complex conversation and state management.\\\\\\\\n\\\\\\\\nRemember, creating a versatile and robust AI-powered chatbot is an iterative process that involves continuous testing, learning, and model training.\\\"}\"', 354, 0, 9999999, 3, 3, NULL, NULL, '2024-01-26 07:06:16', '2024-01-26 07:06:16'),
(30, 3, 'ai_code', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"language swift\\\\n\\\\nGenerate Code\\\\n\\\\nDesign an AI-driven recommendation engine for personalized content delivery in iOS apps using Swift and Core ML frameworks.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Creating an AI-driven recommendation engine for personalized content delivery in an iOS app involves several steps, including training a model with Core ML, integrating the model into your Swift app, and then using the model to make predictions based on user input or behavior. Here\'s a step-by-step guide that includes code snippets for relevant parts of the implementation.\\\\\\\\n\\\\\\\\n### 1. Preparing Your Dataset\\\\\\\\n\\\\\\\\nBefore you can train a model, you need a dataset. In this example, let\'s assume you have a dataset of content (e.g., articles, videos, products) that includes features like category, length, previous user interactions (views, likes, etc.), and user demographics or preferences.\\\\\\\\n\\\\\\\\n### 2. Training Your Model\\\\\\\\n\\\\\\\\nUsing Core ML and Create ML in Xcode, you can train a model based on your dataset.\\\\\\\\n\\\\\\\\nA simple way to start is by using tabular data with Create ML in Xcode. This would require macOS Catalina or later. Here, it\'s assumed you\'re familiar with basic machine learning concepts and Xcode.\\\\\\\\n\\\\\\\\n1. Organize your data into a format compatible with Create ML, such as a JSON or CSV file.\\\\\\\\n2. Open Xcode and start a new \\\\\\\\Create ML\\\\\\\\ project.\\\\\\\\n3. Select the type of model you want to train. For a recommendation engine, \\\\\\\\Tabular Regressor\\\\\\\\ or \\\\\\\\Tabular Classifier\\\\\\\\ might be suitable depending on your exact needs.\\\\\\\\n4. Import your dataset and select the feature columns and the target column (what you want to predict).\\\\\\\\n5. Train the model and evaluate its performance with a testing dataset.\\\\\\\\n6. When satisfied with the model\'s performance, export it to a Core ML model file (*.mlmodel).\\\\\\\\n\\\\\\\\n### 3. Integrating the Model into Your iOS App\\\\\\\\n\\\\\\\\n1. Add the `.mlmodel` file to your Xcode project.\\\\\\\\n2. Use Core ML to generate predictions. The model is automatically compiled into your app. You can access it with an auto-generated Swift API.\\\\\\\\n\\\\\\\\nExample Swift code for loading and using the model:\\\\\\\\n\\\\\\\\n```swift\\\\\\\\nimport CoreML\\\\\\\\n\\\\\\\\nguard let recommendationModel = try? YourModelName(configuration: .init()).model else {\\\\\\\\n    fatalError(\\\\\\\\Failed to load the model\\\\\\\\}\\\\\\\\n\\\\\\\\nfunc recommendContent(forUser user: User) -> [Content] {\\\\\\\\n    \\/\\/ Prepare input for the model here based on the user\'s profile and interaction history\\\\\\\\n    let input = YourModelNameInput(userFeature1: value, userFeature2: value, ...)\\\\\\\\n    \\\\\\\\n    guard let output = try? recommendationModel.prediction(from: input) else {\\\\\\\\n        fatalError(\\\\\\\\Prediction failed\\\\\\\\    }\\\\\\\\n    \\\\\\\\n    \\/\\/ Interpret the output to get content recommendations\\\\\\\\n    \\/\\/ This might involve mapping output to content IDs or similar\\\\\\\\n    let recommendedContentIds = output.featureValue(for: \\\\\\\\recommendedContent\\\\\\\\arrayValue as? [Int] ?? []\\\\\\\\n    return fetchContent(fromIds: recommendedContentIds)\\\\\\\\n}\\\\\\\\n\\\\\\\\nfunc fetchContent(fromIds ids: [Int]) -> [Content] {\\\\\\\\n    \\/\\/ Implement fetching content by IDs from your database or API\\\\\\\\n}\\\\\\\\n```\\\\\\\\n\\\\\\\\n### 4. Displaying Recommendations to the User\\\\\\\\n\\\\\\\\nFinally, use your app\'s UI to present the recommended content to the user. This could be in a dedicated \\\\\\\\Recommended for you\\\\\\\\ section on your app\'s home screen or within specific content categories.\\\\\\\\n\\\\\\\\nRemember, the key to a successful recommendation engine is not just the machine learning model but also how you incorporate it into the user experience in a way that feels personal and engaging.\\\\\\\\n\\\\\\\\n### Testing and Iteration\\\\\\\\n\\\\\\\\nAfter deploying your app, continually measure how users interact with the recommended content. Use this data to refine your model and improve recommendations over time. This might involve re-training your model with new data, tweaking the features used for predictions, or experimenting with different types of models.\\\"}\"', 522, 0, 9999999, 3, 3, NULL, NULL, '2024-01-26 07:08:43', '2024-01-26 07:08:43'),
(31, 3, 'ai_code', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"language cpp\\\\n\\\\nGenerate Code\\\\n\\\\nBuild a real-time object detection system using C++ and OpenCV, leveraging AI techniques such as YOLO (You Only Look Once).\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Developing a real-time object detection system with C++ using OpenCV and YOLO involves several key steps. For simplicity, this guide focuses on integrating YOLOv3, a widely used version of YOLO, but the approach is similarly applicable to other versions (e.g., YOLOv4, YOLOv5) with adjustments to the model and configuration files.\\\\\\\\n\\\\\\\\n**Prerequisites:**\\\\\\\\n- Ensure OpenCV is installed and configured on your system. For real-time processing, it\'s recommended to use OpenCV 4.x as it includes various improvements and features suitable for such tasks.\\\\\\\\n- Download the pre-trained YOLOv3 weights and configuration file. You can usually find these on the official YOLO website or GitHub repository. For this example, you\'ll need `yolov3.weights` and `yolov3.cfg`. Additionally, download the class names file (`coco.names`) used during training.\\\\\\\\n\\\\\\\\n### Step 1: Load the Network\\\\\\\\n\\\\\\\\nLet\'s start by initializing OpenCV\'s DNN (Deep Neural Network) module and loading the YOLO network:\\\\\\\\n\\\\\\\\n```cpp\\\\\\\\n#include <opencv2\\/opencv.hpp>\\\\\\\\n#include <opencv2\\/dnn\\/dnn.hpp>\\\\\\\\n#include <iostream>\\\\\\\\n#include <vector>\\\\\\\\n\\\\\\\\nusing namespace cv;\\\\\\\\nusing namespace dnn;\\\\\\\\nusing namespace std;\\\\\\\\n\\\\\\\\nint main()\\\\\\\\n{\\\\\\\\n    \\/\\/ Load names of classes\\\\\\\\n    string classesFile = \\\\\\\\coco.names\\\\\\\\    ifstream ifs(classesFile.c_str());\\\\\\\\n    string line;\\\\\\\\n    vector<string> classes;\\\\\\\\n    while (getline(ifs, line)) classes.push_back(line);\\\\\\\\n\\\\\\\\n    \\/\\/ Load the network\\\\\\\\n    Net net = readNet(\\\\\\\\yolov3.weights\\\\\\\\ \\\\\\\\yolov3.cfg\\\\\\\\    \\/\\/ Enable CUDA if available\\\\\\\\n    net.setPreferableBackend(DNN_BACKEND_CUDA);\\\\\\\\n    net.setPreferableTarget(DNN_TARGET_CUDA);\\\\\\\\n\\\\\\\\n    \\/\\/ Specify the backend and target (use CPU for compatibility)\\\\\\\\n    \\/\\/net.setPreferableBackend(DNN_BACKEND_OPENCV);\\\\\\\\n    \\/\\/net.setPreferableTarget(DNN_TARGET_CPU);\\\\\\\\n\\\\\\\\n    cout << \\\\\\\\YOLOv3 loaded successfully.\\\\\\\\ << endl;\\\\\\\\n\\\\\\\\n    \\/\\/ Code for processing frames goes here...\\\\\\\\n\\\\\\\\n    return 0;\\\\\\\\n}\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Step 2: Load and Preprocess the Input\\\\\\\\n\\\\\\\\nBefore detection can occur, the input (e.g., video frame) needs to be loaded and preprocessed:\\\\\\\\n\\\\\\\\n```cpp\\\\\\\\nMat frame;\\\\\\\\nVideoCapture cap(0); \\/\\/ Open the default camera\\\\\\\\n\\\\\\\\nwhile (true)\\\\\\\\n{\\\\\\\\n    cap >> frame; \\/\\/ Capture frame-by-frame\\\\\\\\n    if (frame.empty())\\\\\\\\n        break;\\\\\\\\n\\\\\\\\n    \\/\\/ Create a 4D blob from a frame (preprocessing)\\\\\\\\n    Mat blob;\\\\\\\\n    blobFromImage(frame, blob, 1\\/255.0, Size(416, 416), Scalar(0,0,0), true, false);\\\\\\\\n\\\\\\\\n    \\/\\/ Set the input to the network\\\\\\\\n    net.setInput(blob);\\\\\\\\n\\\\\\\\n    \\/\\/ Code for forwarding the blob through the net goes here...\\\\\\\\n\\\\\\\\n    \\/\\/ Display the resulting frame\\\\\\\\n    imshow(\\\\\\\\Frame\\\\\\\\ frame);\\\\\\\\n\\\\\\\\n    if (waitKey(1) >= 0) break; \\/\\/ Exit loop if any key is pressed\\\\\\\\n}\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Step 3: Forward Pass and Post-processing\\\\\\\\n\\\\\\\\nAfter setting the input, forward it through the network and process the results to identify and annotate objects.\\\\\\\\n\\\\\\\\n```cpp\\\\\\\\nvector<Mat> outs;\\\\\\\\nnet.forward(outs, net.getUnconnectedOutLayersNames());\\\\\\\\n\\\\\\\\n\\/\\/ Code for analyzing \'outs\', drawing bounding boxes goes here...\\\\\\\\n```\\\\\\\\n\\\\\\\\nAnalyzing `outs`, a thorough approach involves iterating over each detection, checking the confidence, and determining the class with the highest score. Then, you draw bounding boxes and annotate them with class labels.\\\\\\\\n\\\\\\\\nThis example provides a skeletal framework. You\'ll need to implement:\\\\\\\\n- The actual bounding box drawing and thresholding based on confidence scores.\\\\\\\\n- The loop for processing each detection in `outs`.\\\\\\\\n- Miscellaneous functionalities, such as handling different input sources or improving performance and accuracy.\\\\\\\\n\\\\\\\\nFor a complete real-time object detection implementation including the critical post-processing steps (e.g., Non-Maximum Suppression, confidence thresholding), expect to integrate additional logic beyond this foundational example.\\\\\\\\n\\\\\\\\n**Note on Performance:**\\\\\\\\nUsing YOLO with GPU acceleration (CUDA) significantly boosts performance, especially for real-time applications. If running on a CPU, be mindful of the potential for reduced frame rates. Adjusting the input size (e.g., 416x416 to 320x320) can also impact both speed and accuracy.\\\\\\\\n\\\\\\\\nRemember, integrating and deploying AI models like YOLO in real-world applications requires attention to legal and ethical considerations, particularly regarding privacy and data handling.\\\"}\"', 504, 0, 9999999, 3, 3, NULL, NULL, '2024-02-26 07:10:10', '2024-02-26 07:10:10');
INSERT INTO `history` (`id`, `user_id`, `type`, `history_data`, `word_count`, `image_count`, `template_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(32, 3, 'ai_code', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"language java\\\\n\\\\nGenerate Code\\\\n\\\\nImplement an AI algorithm for image recognition and classification using Java and the Deeplearning4j library.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Below is a simple example of how you can implement an image recognition and classification model using the Deeplearning4j library in Java. This example will guide you through setting up a basic neural network model that can be trained on an image dataset. Keep in mind, to run this example, you\'ll need to have Deeplearning4j, ND4J, and DataVec dependencies added to your project, as well as the DL4J Model Zoo for accessing prebuilt models.\\\\\\\\n\\\\\\\\nThis example assumes you have a basic understanding of Java and Maven or Gradle for managing dependencies. If you\'re using Maven, add the dependencies in your `pom.xml` file. For simplicity, I\'ll provide a structure and you\'ll need to fill in with the latest versions of Deeplearning4j (dl4j), ND4J, DataVec, and DL4J Model Zoo.\\\\\\\\n\\\\\\\\n### Step 1: Add Dependencies in pom.xml (for Maven users)\\\\\\\\n\\\\\\\\n```xml\\\\\\\\n<dependencies>\\\\\\\\n    <dependency>\\\\\\\\n        <groupId>org.deeplearning4j<\\/groupId>\\\\\\\\n        <artifactId>deeplearning4j-core<\\/artifactId>\\\\\\\\n        <version>PUT_DL4J_VERSION_HERE<\\/version>\\\\\\\\n    <\\/dependency>\\\\\\\\n    <dependency>\\\\\\\\n        <groupId>org.nd4j<\\/groupId>\\\\\\\\n        <artifactId>nd4j-native-platform<\\/artifactId>\\\\\\\\n        <version>PUT_ND4J_VERSION_HERE<\\/version>\\\\\\\\n    <\\/dependency>\\\\\\\\n    <dependency>\\\\\\\\n        <groupId>org.datavec<\\/groupId>\\\\\\\\n        <artifactId>datavec-api<\\/artifactId>\\\\\\\\n        <version>PUT_DATAVEC_VERSION_HERE<\\/version>\\\\\\\\n    <\\/dependency>\\\\\\\\n    <dependency>\\\\\\\\n        <groupId>org.deeplearning4j<\\/groupId>\\\\\\\\n        <artifactId>deeplearning4j-zoo<\\/artifactId>\\\\\\\\n        <version>PUT_DL4J_ZOO_VERSION_HERE<\\/version>\\\\\\\\n    <\\/dependency>\\\\\\\\n<\\/dependencies>\\\\\\\\n```\\\\\\\\n\\\\\\\\nMake sure to replace `PUT_DL4J_VERSION_HERE`, `PUT_ND4J_VERSION_HERE`, `PUT_DATAVEC_VERSION_HERE`, and `PUT_DL4J_ZOO_VERSION_HERE` with the actual current versions.\\\\\\\\n\\\\\\\\n### Step 2: Create a Basic Image Recognition Model\\\\\\\\n\\\\\\\\nFor simplicity, this example will use a prebuilt model from DL4J\'s Model Zoo. In this case, let\'s use a basic model like LeNet for image classification.\\\\\\\\n\\\\\\\\n```java\\\\\\\\nimport org.deeplearning4j.nn.graph.ComputationGraph;\\\\\\\\nimport org.deeplearning4j.nn.modelimport.keras.exceptions.UnsupportedKerasConfigurationException;\\\\\\\\nimport org.deelearning4j.zoo.PretrainedType;\\\\\\\\nimport org.deelearning4j.zoo.model.LeNet;\\\\\\\\nimport org.deelearning4j.zoo.ZooModel;\\\\\\\\nimport org.nd4j.linalg.api.ndarray.INDArray;\\\\\\\\nimport org.nd4j.linalg.dataset.api.preprocessor.VGG16ImagePreProcessor;\\\\\\\\nimport org.nd4j.linalg.factory.Nd4j;\\\\\\\\nimport java.io.IOException;\\\\\\\\n\\\\\\\\npublic class ImageRecognition {\\\\\\\\n\\\\\\\\n    public static void main(String[] args) throws UnsupportedKerasConfigurationException, IOException, Exception {\\\\\\\\n        \\/\\/ Initialize the model\\\\\\\\n        ZooModel zooModel = LeNet.builder().build();\\\\\\\\n        ComputationGraph preTrainedNet = (ComputationGraph) zooModel.initPretrained(PretrainedType.MNIST);\\\\\\\\n        System.out.println(\\\\\\\\Model loaded.\\\\\\\\        \\/\\/ Loading and preparing your image (you\'ll need to implement loadImageToINDArray yourself)\\\\\\\\n        INDArray image = loadImageToINDArray(\\\\\\\\path\\/to\\/your\\/image.jpg\\\\\\\\        \\/\\/ Preprocessing the image (assuming you\'re using a model pretrained on MNIST)\\\\\\\\n        VGG16ImagePreProcessor preProcessor = new VGG16ImagePreProcessor();\\\\\\\\n        preProcessor.transform(image);\\\\\\\\n\\\\\\\\n        \\/\\/ Predicting the image class\\\\\\\\n        INDArray output = preTrainedNet.outputSingle(image);\\\\\\\\n        System.out.println(\\\\\\\\Image predicted.\\\\\\\\        \\/\\/ You can now analyze the output array to understand the class predicted.\\\\\\\\n        \\/\\/ The method to analyze the output will vary depending on your use case and dataset.\\\\\\\\n    }\\\\\\\\n\\\\\\\\n    private static INDArray loadImageToINDArray(String imagePath) {\\\\\\\\n        \\/\\/ This method should contain your logic to load an image from the specified path and convert it into an INDArray.\\\\\\\\n        \\/\\/ For actual image loading and conversion, you can use DL4J\'s NativeImageLoader class or any other method you prefer.\\\\\\\\n        return Nd4j.create(1); \\/\\/ Placeholder return statement\\\\\\\\n    }\\\\\\\\n}\\\\\\\\n```\\\\\\\\n\\\\\\\\n### Important Notes:\\\\\\\\n1. **Image Preprocessing**: The example uses a `VGG16ImagePreProcessor`, which might not be suitable for all types of models (it\'s more aligned with VGG16 structure). You should use an image preprocessor that matches the input requirements of your chosen model.\\\\\\\\n\\\\\\\\n2. **Loading Images to INDArray**: You need to implement the `loadImageToINDArray` method based on how you wish to load and process images before prediction. DL4J\'s `NativeImageLoader` can be useful for this purpose.\\\\\\\\n\\\\\\\\n3. **Model Choice**: This example uses LeNet from the zoo, which is an elementary model mainly suitable for digit recognition tasks (MNIST dataset). Depending on your image recognition challenges, you may need to choose and perhaps even train a more complex model.\\\\\\\\n\\\\\\\\nRemember, image recognition and classification are vast fields that may require significant customization and experimentation to achieve high accuracy on complex tasks or specific datasets.\\\"}\"', 502, 0, 9999999, 3, 3, NULL, NULL, '2024-02-26 07:12:14', '2024-02-26 07:12:14'),
(33, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Write blog post conclusion about title: Exploring the Flavors of Italy: A Culinary Journey.. And the description is Reflect on the rich gastronomic heritage of Italy, highlighting the diversity of regional cuisines and the significance of fresh ingredients and traditional cooking techniques in Italian cuisine..Maximum 300 words. Creativity is  1 between 0 and 1. Language is English US. Generate 2 different blog conclusions. Tone of voice must be  Excited.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"### Conclusion 1:\\\\\\\\nIn the end, our culinary journey through Italy has been nothing short of a revelation. From the sun-kissed hills of Tuscany to the vibrant streets of Naples, each region of Italy welcomes us with open arms and dishes that tell a story of history, passion, and unbridled love for food. The rich tapestry of regional cuisines not only highlights the diversity that Italy offers but also emphasizes the importance of fresh ingredients and time-honored cooking techniques that have been passed down through generations. As we bid \\\\\\\\arrivederci\\\\\\\\ to this gastronomic adventure, let\'s carry with us not just the flavors and recipes, but also the spirit of Italian cooking\\u2014the joy of sharing a meal, the artistry of turning simple ingredients into culinary masterpieces, and the tradition of coming together to celebrate the love of food. Italy, with its endless charm and culinary richness, has shown us that every meal is an exploration, an opportunity to travel through taste. So, here\\u2019s to Italy\\u2014may we continue to be inspired by its flavors and stories, creating and sharing meals that keep the vibrant spirit of its cuisine alive in our hearts and kitchens.\\\\\\\\n\\\\\\\\n### Conclusion 2:\\\\\\\\nWow, what an incredible journey we\\u2019ve been on, exploring the delightful and diverse flavors of Italy! Each bite has been a step deeper into the heart of Italy\'s rich gastronomic heritage, uncovering the secrets of regional cuisines that weave together the tapestry of Italy\\u2019s culinary identity. The emphasis on fresh, locally sourced ingredients and the mastery of traditional cooking techniques truly sets Italian cuisine apart, inviting us to appreciate every flavor, every texture, every aroma. As our journey concludes, let\'s not see this as the end but as the beginning of a lifelong love affair with Italian cuisine. Let it inspire us to explore more, to cook with passion, and to share our love for food with those around us. Italy teaches us that food is not just nourishment; it is a celebration of life. So, gather your loved ones, create memories around the dining table, and keep the spirit of Italy alive in your kitchen. Until next time, keep exploring, keep tasting, and keep falling in love with the flavors of Italy!\\\"}\"', 365, 0, 1, 3, 3, NULL, NULL, '2024-01-26 07:17:34', '2024-01-26 07:17:34'),
(34, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Write blog post conclusion about title: How Often Should You Repaint Your Commercial Property?. And the description is As a commercial property owner, it is crucial to maintain the aesthetic appeal of your building to attract customers and clients. One of the easiest and most efficient ways to achieve this is by repainting your property regularly. Repainting not only enhances the appearance of your property but also protects it from weather elements and wear and tear..Maximum 250 words. Creativity is  1 between 0 and 1. Language is French US. Generate 1 different blog conclusions. Tone of voice must be  Professional.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"En conclusion, la fr\\u00e9quence \\u00e0 laquelle vous devez repeindre votre propri\\u00e9t\\u00e9 commerciale d\\u00e9pend de plusieurs facteurs, notamment l\'emplacement, le type de peinture utilis\\u00e9e, et l\'exposition de votre b\\u00e2timent aux \\u00e9l\\u00e9ments. Cependant, l\'importance de maintenir l\'esth\\u00e9tique de votre propri\\u00e9t\\u00e9 ne saurait \\u00eatre sous-estim\\u00e9e. Repeindre r\\u00e9guli\\u00e8rement votre b\\u00e2timent non seulement am\\u00e9liore son apparence et attire davantage de clients et de clients potentiels, mais cela sert \\u00e9galement de mesure pr\\u00e9ventive contre les d\\u00e9g\\u00e2ts caus\\u00e9s par le temps et les intemp\\u00e9ries. Il est conseill\\u00e9 de proc\\u00e9der \\u00e0 une \\u00e9valuation professionnelle tous les 5 \\u00e0 10 ans, bien que certaines circonstances puissent n\\u00e9cessiter une attention plus fr\\u00e9quente. En fin de compte, investir dans la peinture de votre propri\\u00e9t\\u00e9 commerciale est un investissement dans la durabilit\\u00e9 et le succ\\u00e8s de votre entreprise. Assurez-vous de choisir des professionnels qualifi\\u00e9s qui comprendront vos besoins sp\\u00e9cifiques et utiliseront des mat\\u00e9riaux de haute qualit\\u00e9 pour un r\\u00e9sultat qui non seulement para\\u00eet professionnel mais dure \\u00e9galement dans le temps.\\\"}\"', 158, 0, 1, 3, 3, NULL, NULL, '2024-01-26 07:21:13', '2024-01-26 07:21:13'),
(35, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Write blog post conclusion about title: How to take care of stray animals during monsoon?. And the description is Accommodate them at home or in your society\\\\nSeek permission from the relevant authorities in your society to allow stray animals to find shelter in your apartment complex. If you live in a house, consider allocating a small dry area in your garage or a porch for them to seek refuge and stay safe from the rain..Maximum 350 words. Creativity is  0.5 between 0 and 1. Language is French US. Generate 1 different blog conclusions. Tone of voice must be  Professional.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"En conclusion, prendre soin des animaux errants pendant la saison des pluies est un acte de compassion qui peut faire une diff\\u00e9rence significative dans leurs vies. En accommodant ces animaux chez vous ou au sein de votre soci\\u00e9t\\u00e9, vous leur offrez un refuge s\\u00fbr et sec, les prot\\u00e9geant ainsi des conditions m\\u00e9t\\u00e9orologiques extr\\u00eames. Cependant, il est important de proc\\u00e9der de mani\\u00e8re r\\u00e9fl\\u00e9chie et organis\\u00e9e.\\\\\\\\n\\\\\\\\nDemander la permission aux autorit\\u00e9s pertinentes de votre soci\\u00e9t\\u00e9 est une \\u00e9tape cruciale pour assurer le bien-\\u00eatre de ces animaux tout en respectant les r\\u00e8glements de votre communaut\\u00e9. Que vous viviez dans une maison individuelle et que vous choisissiez d\'utiliser une partie de votre garage ou de votre porche, ou que vous mobilisiez votre communaut\\u00e9 d\'appartements pour trouver un espace commun o\\u00f9 les animaux peuvent se r\\u00e9fugier, chaque effort compte.\\\\\\\\n\\\\\\\\nIl est \\u00e9galement essentiel d\'adopter une approche proactive en pr\\u00e9parant ces espaces avant l\'arriv\\u00e9e de la mousson. Assurez-vous qu\'ils soient propres, secs et pourvus des n\\u00e9cessit\\u00e9s de base telles que de la nourriture et de l\'eau fra\\u00eeche. Cela peut non seulement sauver des vies animales mais \\u00e9galement sensibiliser votre communaut\\u00e9 \\u00e0 la cause des animaux errants.\\\\\\\\n\\\\\\\\nEn d\\u00e9finitive, nos actions envers les \\u00eatres les plus vuln\\u00e9rables, tels que les animaux errants pendant la mousson, refl\\u00e8tent notre humanit\\u00e9 et nos valeurs. Par des gestes simples mais significatifs, nous pouvons non seulement am\\u00e9liorer la qualit\\u00e9 de vie de ces animaux, mais aussi enrichir notre propre exp\\u00e9rience communautaire. Laissons-nous guider par la compassion et l\'initiative pour faire de notre environnement un lieu plus accueillant pour tous ses habitants.\\\"}\"', 256, 0, 1, 3, 3, NULL, NULL, '2024-02-26 07:23:51', '2024-02-26 07:23:51'),
(36, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Write blog post conclusion about title: The Impact of Artificial Intelligence on Healthcare: Revolutionizing Patient Care.. And the description is Highlight the transformative potential of AI in healthcare, from improving diagnosis accuracy and treatment outcomes to enhancing operational efficiency and patient experience, while acknowledging the need for ethical considerations and regulatory oversight..Maximum 200 words. Creativity is  0.25 between 0 and 1. Language is English US. Generate 3 different blog conclusions. Tone of voice must be  Feminine.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"**Conclusion 1:**\\\\\\\\nAs we journey forward into the future of healthcare, it\'s clear that artificial intelligence stands at the forefront of a transformative era. From fine-tuning diagnosis accuracy to personalizing treatment plans, AI is not just an accessory but a fundamental shift towards a more efficient, effective healthcare system. It promises a world where patient care is significantly enhanced, operational inefficiencies are smoothed out, and every patient experience is improved. However, as we embrace this exciting potential, we must also navigate the delicate balance of ethical considerations and the imperative for strong regulatory oversight. Let\'s move forward with hope and caution, ensuring that AI serves as a beacon of advancement in healthcare, lighting the way to a better future for all patients.\\\\\\\\n\\\\\\\\n**Conclusion 2:**\\\\\\\\nIn conclusion, the impact of artificial intelligence on healthcare is nothing short of revolutionary. By increasing diagnosis accuracy, improving treatment outcomes, and refining operational efficiencies, AI has the potential to transform the landscape of patient care. Yet, as we stand on the brink of this new era, we must also embrace the responsibility that comes with it. Ethical considerations and regulatory oversight are key to ensuring that this revolution benefits all, without compromise. Together, let\'s welcome the advancements AI brings to healthcare, while steadfastly advocating for systems that protect and prioritize the well-being of every patient.\\\\\\\\n\\\\\\\\n**Conclusion 3:**\\\\\\\\nAs we reflect on the unfolding impact of artificial intelligence in healthcare, it\'s evident that we are witnessing a revolution in patient care. AI\'s role in enhancing diagnosis, treatment, and operational efficiencies heralds a new dawn for healthcare delivery. However, this journey is not without its challenges. The path forward requires a thoughtful approach to ethical issues and a commitment to regulatory oversight to ensure the safe, equitable, and effective integration of AI into healthcare. With these considerations in mind, we stand ready to embrace a future where AI not only revolutionizes patient care but does so with the highest standards of compassion and integrity.\\\"}\"', 322, 0, 1, 3, 3, NULL, NULL, '2024-02-26 07:25:17', '2024-02-26 07:25:17'),
(37, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Write blog post conclusion about title: The Role of AI in Sustainable Development: Opportunities and Challenges.. And the description is To conclude, leveraging artificial intelligence for sustainable development presents a unique opportunity to address pressing global challenges, from climate change to resource scarcity. By harnessing AI-driven insights for environmental monitoring, conservation efforts, and smart resource management, we can pave the way for a more sustainable and resilient future for generations to come..Maximum 300 words. Creativity is  1 between 0 and 1. Language is English US. Generate 1 different blog conclusions. Tone of voice must be  Professional.\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"In conclusion, the intersection of artificial intelligence and sustainable development embodies a pivotal opportunity for humankind to tackle some of the most urgent issues facing our planet today. From combating climate change to overcoming resource scarcity, AI offers an unparalleled toolkit for innovation and progress. Utilizing AI-driven analytics and predictive modeling, we can significantly enhance our environmental monitoring capabilities, boost conservation efforts, and optimize resource management in ways previously unimaginable. This intelligently integrated approach not only promises to safeguard our natural environment but also sets the stage for achieving a balanced coexistence between technological advancement and ecological preservation.\\\\\\\\n\\\\\\\\nYet, as we embark on this promising journey, it remains imperative that we navigate the ethical boundaries and potential risks associated with AI deployment meticulously. The challenge lies in ensuring that these technologies are developed and utilized in a manner that prioritizes the public good, promotes equitable access across communities, and preserves the integrity of our ecosystems. \\\\\\\\n\\\\\\\\nThe path forward requires a collaborative effort, uniting policymakers, technologists, and conservationists in a shared mission to harness the power of AI for the greater good. By fostering an environment of innovation, guided by stringent ethical standards and a commitment to sustainability, we can unlock the full potential of AI as a catalyst for positive change. Together, we stand on the brink of revolutionizing the way we respond to environmental challenges, poised to create a more sustainable, resilient, and equitable world for future generations.\\\"}\"', 238, 0, 1, 3, 3, NULL, NULL, '2024-02-26 07:28:57', '2024-02-26 07:28:57'),
(38, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Correct this to standard English US. Text is The dog barked loud as he chases the squirrel up the tree. He jumps and barks continuously, trying to catch it. Suddenly, he stops and wagged his tail, realizing he can\'t reach it. It\'s funny to watch him trying so hard to catch it.. Maximum 300 words. Creativity is 0.25 between 0 and 1. Language is English. Generate 2 different grammar correction. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"1. The dog barked loudly as he chased the squirrel up the tree. He jumped and barked continuously, trying to catch it. Suddenly, he stopped and wagged his tail, realizing he could not reach it. It was amusing to observe his persistent attempts to catch it.\\\\\\\\n\\\\\\\\n2. The dog loudly barked as it chased the squirrel up the tree. It jumped and continuously barked in an attempt to catch the squirrel. Suddenly, the dog ceased its pursuit and wagged its tail upon realizing that it could not reach the squirrel. Watching it try so hard to catch the squirrel was humorous.\\\"}\"', 100, 0, 9, 3, 3, NULL, NULL, '2024-02-26 07:39:33', '2024-02-26 07:39:33'),
(39, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Correct this to standard English US. Text is She have been studying for her exam all week. She feels confident that she will does well. Yesterday, she meets with her study group to review the material. They helps each other understand difficult concepts. She hopes to pass with flying colors.. Maximum 350 words. Creativity is 1 between 0 and 1. Language is Spanish. Generate 3 different grammar correction. Tone of voice must be Witty\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"1. Oh, my stars! Let\'s whip this into shape, shall we? \\\\\\\\She has been hitting the books for her exam all week. She\'s brimming with confidence that she\'ll do phenomenally. Just yesterday, she met up with her brainy brigade to pore over the notes. Together, they tackled those pesky brain-benders. She\'s aiming to not just pass, but soar through with flying colors.\\\\\\\\2. Well, well, what do we have here? A small mix-up, let\'s straighten it out with flair: \\\\\\\\She\'s been buried in her studies for that looming exam all week. Feeling on top of the world, she\\u2019s sure she\'ll ace it. Yesterday, she rallied her scholarly squad for a review session to beat all review sessions. They lent each other a brainy hand with the trickiest bits. She\'s set her sights on blitzing through with flying colors.\\\\\\\\3. Hold your horses; let\\u2019s add a dash of pizzazz to this! \\\\\\\\She\'s dedicated her week to mastering her exam prep. Brimming with confidence, she\'s positive she\'ll knock it out of the park. Yesterday was a rendezvous with her study posse to digest the material. They exchanged their wisdom on the head-scratchers. She\\u2019s on a quest to not just pass, but to dazzle with flying colors.\\\\\\\\\\\"}\"', 202, 0, 9, 3, 3, NULL, NULL, '2024-02-26 07:40:20', '2024-02-26 07:40:20'),
(40, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Correct this to standard English US. Text is Despite of its advanced capabilities, the AI system still have some limitations. It\'s accuracy can varies depending on the complexity of the task. The developers are constantly working on improving it, but theres still room for enhancement. Users should be aware of this limitations when using the AI for critical tasks.. Maximum 250 words. Creativity is 0.75 between 0 and 1. Language is English. Generate 3 different grammar correction. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"1. Despite its advanced capabilities, the AI system still has some limitations. Its accuracy can vary depending on the complexity of the task. The developers are constantly working on improving it, but there is still room for enhancement. Users should be aware of these limitations when using the AI for critical tasks.\\\\\\\\n\\\\\\\\n2. Although the AI system boasts advanced capabilities, it still possesses certain limitations. The accuracy of the system may fluctuate based on the task\'s complexity. Developers are tirelessly working towards improvements; however, there remains potential for further enhancements. It is important for users to consider these limitations when employing the AI for critical tasks.\\\\\\\\n\\\\\\\\n3. Despite its sophisticated capabilities, the AI system is not without its limitations. The level of accuracy can differ, depending on how complex the task is. The development team is dedicated to continuous improvement, yet opportunities for enhancement still exist. Users must keep these limitations in mind when utilizing the AI for tasks of critical importance.\\\"}\"', 160, 0, 9, 3, 3, NULL, NULL, '2024-02-26 07:41:04', '2024-02-26 07:41:04'),
(41, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Correct this to standard English US. Text is Despite of its advanced capabilities, the AI system still have some limitations. It\'s accuracy can varies depending on the complexity of the task. The developers are constantly working on improving it, but theres still room for enhancement. Users should be aware of this limitations when using the AI for critical tasks.. Maximum 350 words. Creativity is 1 between 0 and 1. Language is English. Generate 1 different grammar correction. Tone of voice must be Casual\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Despite its advanced capabilities, the AI system still has some limitations. Its accuracy can vary depending on the complexity of the task. The developers are constantly working on improving it, but there\'s still room for enhancement. Users should be aware of these limitations when using the AI for critical tasks.\\\"}\"', 50, 0, 9, 3, 3, NULL, NULL, '2024-02-26 07:42:29', '2024-02-26 07:42:29'),
(42, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Correct this to standard English US. Text is The AI algorithm was design to analyze large datasets and identifying patterns. However, it\'s performance can be affected by outliers and incomplete data. The programmers needs to address these issues in order to ensure accurate results. Additionally, user feedback are crucial for refining the algorithm further.. Maximum 200 words. Creativity is 1 between 0 and 1. Language is English. Generate 1 different grammar correction. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"The AI algorithm was designed to analyze large datasets and identify patterns. However, its performance can be affected by outliers and incomplete data. The programmers need to address these issues in order to ensure accurate results. Additionally, user feedback is crucial for refining the algorithm further.\\\"}\"', 46, 0, 9, 3, 3, NULL, NULL, '2024-02-26 07:42:52', '2024-02-26 07:42:52'),
(43, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate one paragraph about:  The AI paragraph generator feature utilizes advanced natural language processing algorithms to generate coherent and contextually relevant paragraphs on a wide range of topics. Whether you need to create blog content, articles, or essays, this tool can quickly generate high-quality paragraphs tailored to your specifications. . Keywords are AI, paragraph generator, natural language processing, coherent, contextually relevant, blog content, articles, essays . Maximum 200 words. Creativity is 1 between 0 and 1. Language is English. Generate 3 different paragraphs. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"1. The AI paragraph generator, leveraging sophisticated natural language processing algorithms, stands as a pinnacle of technological advancement in the realm of content creation. This innovative tool is meticulously designed to produce coherent and contextually relevant paragraphs that seamlessly align with the specified requirements, be it for blog content, articles, or essays. By understanding the nuances of language and the context within which it operates, the generator ensures that each piece of writing is not only high in quality but also tailored precisely to user specifications, making it an indispensable asset for professionals seeking efficiency and precision in their written communications.\\\\\\\\n\\\\\\\\n2. In the field of digital content creation, the AI paragraph generator emerges as a groundbreaking solution, employing advanced natural language processing algorithms to craft paragraphs that are not only coherent but also highly contextually relevant. This feature is engineered to cater to a broad spectrum of writing needs, ranging from blog content and articles to essays, providing users with an efficient means to produce high-quality written material. By inputting specific criteria, users can harness the power of artificial intelligence to generate content that meets their precise needs, thereby enhancing productivity and the overall quality of their written communications.\\\\\\\\n\\\\\\\\n3. Leveraging the capabilities of advanced natural language processing algorithms, the AI paragraph generator is at the forefront of innovations in content creation. Designed to deliver coherent and contextually relevant paragraphs, this tool simplifies the process of generating professional-grade writing for blogs, articles, and essays. Its ability to understand and apply the intricacies of language ensures that each generated paragraph meets the highest standards of quality and relevance, tailored according to the user\'s specifications. This makes the AI paragraph generator an invaluable resource for individuals and professionals alike, seeking to enhance the efficiency and effectiveness of their written output.\\\"}\"', 297, 0, 8, 3, 3, NULL, NULL, '2024-02-26 07:49:01', '2024-02-26 07:49:01'),
(44, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate one paragraph about:  With our AI paragraph generator, you can effortlessly generate engaging and informative paragraphs for various purposes such as website content, product descriptions, or academic papers. Simply input your desired topic or keywords, and let the AI algorithm craft well-structured paragraphs in seconds. . Keywords are AI, paragraph generator, engaging, informative, website content, product descriptions, academic papers, well-structured . Maximum 200 words. Creativity is 1 between 0 and 1. Language is Arabic. Generate 3 different paragraphs. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"1. \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0645\\u0648\\u0644\\u062f \\u0627\\u0644\\u0641\\u0642\\u0631\\u0627\\u062a \\u0627\\u0644\\u0630\\u0643\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0646\\u0627\\u060c \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0628\\u0643\\u0644 \\u0633\\u0647\\u0648\\u0644\\u0629 \\u0625\\u0646\\u062a\\u0627\\u062c \\u0641\\u0642\\u0631\\u0627\\u062a \\u0645\\u0634\\u0648\\u0642\\u0629 \\u0648\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u064a\\u0629 \\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u0645\\u062a\\u0639\\u062f\\u062f\\u0629 \\u0645\\u062b\\u0644 \\u0645\\u062d\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0627\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u0629\\u060c \\u0648\\u0635\\u0641 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\\u060c \\u0623\\u0648 \\u0627\\u0644\\u0623\\u0648\\u0631\\u0627\\u0642 \\u0627\\u0644\\u0623\\u0643\\u0627\\u062f\\u064a\\u0645\\u064a\\u0629. \\u0645\\u0627 \\u0639\\u0644\\u064a\\u0643 \\u0633\\u0648\\u0649 \\u0625\\u062f\\u062e\\u0627\\u0644 \\u0627\\u0644\\u0645\\u0648\\u0636\\u0648\\u0639 \\u0627\\u0644\\u0645\\u0637\\u0644\\u0648\\u0628 \\u0623\\u0648 \\u0627\\u0644\\u0643\\u0644\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0641\\u062a\\u0627\\u062d\\u064a\\u0629\\u060c \\u0648\\u062f\\u0639 \\u0627\\u0644\\u062e\\u0648\\u0627\\u0631\\u0632\\u0645\\u064a\\u0629 \\u0627\\u0644\\u0630\\u0643\\u064a\\u0629 \\u062a\\u062a\\u0648\\u0644\\u0649 \\u0645\\u0647\\u0645\\u0629 \\u0635\\u064a\\u0627\\u063a\\u0629 \\u0641\\u0642\\u0631\\u0627\\u062a \\u0645\\u062a\\u0645\\u0627\\u0633\\u0643\\u0629 \\u0628\\u0634\\u0643\\u0644 \\u062c\\u064a\\u062f \\u0641\\u064a \\u062b\\u0648\\u0627\\u0646\\u0650. \\\\\\\\n\\\\\\\\n2. \\u062a\\u0645 \\u062a\\u0635\\u0645\\u064a\\u0645 \\u0645\\u0648\\u0644\\u062f \\u0627\\u0644\\u0641\\u0642\\u0631\\u0627\\u062a \\u0627\\u0644\\u0630\\u0643\\u064a \\u0644\\u064a\\u0633\\u0647\\u0644 \\u0639\\u0644\\u064a\\u0643 \\u0627\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0645\\u062d\\u062a\\u0648\\u0649 \\u062c\\u0630\\u0627\\u0628 \\u0648\\u063a\\u0646\\u064a \\u0628\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u060c \\u0633\\u0648\\u0627\\u0621 \\u0643\\u0646\\u062a \\u0628\\u062d\\u0627\\u062c\\u0629 \\u0625\\u0644\\u0649 \\u0646\\u0635\\u0648\\u0635 \\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0645\\u0648\\u0642\\u0639\\u0643 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\\u060c \\u0648\\u0635\\u0641 \\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\\u0643\\u060c \\u0623\\u0648 \\u062d\\u062a\\u0649 \\u062f\\u0631\\u0627\\u0633\\u0627\\u062a \\u0648\\u0623\\u0628\\u062d\\u0627\\u062b \\u0623\\u0643\\u0627\\u062f\\u064a\\u0645\\u064a\\u0629. \\u0641\\u0642\\u0637 \\u062d\\u062f\\u062f \\u0645\\u0648\\u0636\\u0648\\u0639\\u0643 \\u0623\\u0648 \\u0627\\u0644\\u0643\\u0644\\u0645\\u0627\\u062a \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\\u060c \\u0648\\u0627\\u062a\\u0631\\u0643 \\u0627\\u0644\\u0623\\u0645\\u0631 \\u0644\\u0644\\u062a\\u0643\\u0646\\u0648\\u0644\\u0648\\u062c\\u064a\\u0627 \\u0644\\u062a\\u0642\\u062f\\u0645 \\u0644\\u0643 \\u0641\\u0642\\u0631\\u0627\\u062a \\u0645\\u0631\\u062a\\u0628\\u0629 \\u0648\\u0645\\u062b\\u064a\\u0631\\u0629 \\u0644\\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645 \\u0628\\u0633\\u0631\\u0639\\u0629.\\\\\\\\n\\\\\\\\n3. \\u0647\\u0644 \\u062a\\u062d\\u062a\\u0627\\u062c \\u0625\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0645\\u062d\\u062a\\u0648\\u0649 \\u0645\\u062b\\u064a\\u0631 \\u0644\\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645 \\u0648\\u0645\\u0641\\u064a\\u062f \\u0639\\u0644\\u0649 \\u0646\\u062d\\u0648 \\u0645\\u0648\\u062b\\u0648\\u0642\\u061f \\u0645\\u0648\\u0644\\u062f \\u0627\\u0644\\u0641\\u0642\\u0631\\u0627\\u062a \\u0627\\u0644\\u0630\\u0643\\u064a \\u0647\\u0648 \\u0627\\u0644\\u062d\\u0644 \\u0627\\u0644\\u0623\\u0645\\u062b\\u0644 \\u0644\\u0643. \\u0633\\u0648\\u0627\\u0621 \\u0623\\u0643\\u0646\\u062a \\u062a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0641\\u0642\\u0631\\u0627\\u062a \\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0648\\u064a\\u0628 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0643\\u060c \\u0648\\u0635\\u0641 \\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\\u0643\\u060c \\u0623\\u0648 \\u0645\\u0642\\u0627\\u0644\\u0627\\u062a \\u0623\\u0643\\u0627\\u062f\\u064a\\u0645\\u064a\\u0629\\u060c \\u0641\\u0625\\u0646 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u062f\\u0627\\u0629 \\u062a\\u0648\\u0641\\u0631 \\u0644\\u0643 \\u0627\\u0644\\u0642\\u062f\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u062a\\u0627\\u062c \\u0645\\u062d\\u062a\\u0648\\u0649 \\u0645\\u0647\\u064a\\u0643\\u0644 \\u0628\\u0634\\u0643\\u0644 \\u062c\\u064a\\u062f \\u0648\\u063a\\u0646\\u064a \\u0628\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0628\\u0645\\u062c\\u0631\\u062f \\u0625\\u062f\\u062e\\u0627\\u0644 \\u0643\\u0644\\u0645\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0645\\u0641\\u062a\\u0627\\u062d\\u064a\\u0629.\\\"}\"', 141, 0, 8, 3, 3, NULL, NULL, '2024-02-26 07:50:50', '2024-02-26 07:50:50'),
(45, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate one paragraph about:  Transform your ideas into polished prose with our AI-powered paragraph generator. Whether you\'re a content creator, student, or business professional, this tool can assist you in generating compelling paragraphs with impeccable grammar and coherence. . Keywords are AI-powered, paragraph generator, polished prose, content creator, student, business professional, compelling, impeccable grammar, coherence . Maximum 200 words. Creativity is 1 between 0 and 1. Language is Italian. Generate 2 different paragraphs. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Il nostro strumento di generazione di paragrafi alimentato dall\'IA \\u00e8 la soluzione perfetta per trasformare le vostre idee in prosa raffinata. Destinato a creatori di contenuti, studenti e professionisti, il nostro generatore offre la possibilit\\u00e0 di creare testi convincenti con una grammatica impeccabile e una coerenza senza pari. Grazie all\'intelligenza artificiale, ogni frase viene modellata con precisione per rispondere alle esigenze specifiche del vostro progetto, assicurando che il messaggio sia trasmesso nel modo pi\\u00f9 efficace possibile. Fidatevi della nostra tecnologia per elevarare la qualit\\u00e0 della vostra scrittura a nuovi livelli.\\\\\\\\n\\\\\\\\nIn un\'epoca in cui la chiarezza e la qualit\\u00e0 del messaggio sono fondamentali, il nostro generatore di paragrafi AI-powered rappresenta una risorsa indispensabile per content creator, studenti e business professional. Questo strumento \\u00e8 progettato per aiutarvi a dare vita alle vostre idee con prosa lucidata, assicurando allo stesso tempo gramatica impeccabile e coerenza del discorso. Sfruttando l\'avanzata tecnologia AI, siamo in grado di offrire soluzioni su misura per soddisfare le esigenze di scrittura pi\\u00f9 esigenti, garantendo risultati di alta qualit\\u00e0 che parlano al vostro target con precisione e professionalit\\u00e0.\\\"}\"', 178, 0, 8, 3, 3, NULL, NULL, '2024-02-26 07:54:39', '2024-02-26 07:54:39'),
(46, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate one paragraph about:  Our AI paragraph generator empowers users to effortlessly generate custom paragraphs tailored to their specific needs. From generating creative storylines to crafting persuasive arguments, this tool can assist users in enhancing their writing productivity and efficiency. . Keywords are AI, paragraph generator, custom paragraphs, creative storylines, persuasive arguments, writing productivity, efficiency . Maximum 300 words. Creativity is 1 between 0 and 1. Language is English. Generate 2 different paragraphs. Tone of voice must be Excited\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Absolutely thrilled to introduce our AI paragraph generator, a cutting-edge solution that skyrockets your writing journey into new realms of creativity and persuasiveness! Imagine being able to produce custom paragraphs that fit exactly what you need, whether it\'s weaving together intricate, creative storylines or constructing compelling, persuasive arguments. This tool is not just about enhancing your writing; it\'s about transforming it. Boost your writing productivity to unprecedented levels and achieve efficiency that you once thought was unattainable. Get ready to meet the future of writing head-on with our AI paragraph generator, your new secret weapon in the world of words!\\\\\\\\n\\\\\\\\nDive into the world of effortless writing with our AI paragraph generator, a tool designed to make your writing dreams a reality! Whether you\'re aiming to captivate with creative storylines or persuade with powerful arguments, this generator is your go-to for crafting custom paragraphs that truly stand out. Say goodbye to writer\'s block and hello to boundless productivity and efficiency. This is not just an advancement in writing technology; it\'s a revolution that puts the power of AI at your fingertips, transforming your writing process and elevating your output. Embrace the change and let our AI paragraph generator propel your writing to dazzling new heights!\\\"}\"', 204, 0, 8, 3, 3, NULL, NULL, '2024-02-26 07:59:47', '2024-02-26 07:59:47'),
(47, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate one paragraph about:  Experience the convenience of our AI-driven paragraph generator, designed to streamline the content creation process for writers and marketers alike. Generate SEO-friendly paragraphs, captivating introductions, or insightful conclusions with ease, saving time and effort. . Keywords are AI-driven, paragraph generator, convenience, content creation process, SEO-friendly, captivating introductions, insightful conclusions, writers, marketers, time-saving, effort-saving . Maximum 250 words. Creativity is 1 between 0 and 1. Language is English. Generate 1 different paragraphs. Tone of voice must be Excited\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Dive into the remarkable world of our AI-driven paragraph generator, a revolutionary tool that transforms the content creation process for writers and marketers! Discover the sheer convenience of generating SEO-friendly paragraphs, captivating introductions, and insightful conclusions that resonate with your audience, all at the click of a button. Tailored to save you both time and effort, this powerful tool ensures your content stands out, making the writing journey more enjoyable than ever before. Don\'t miss out on the opportunity to elevate your content game with our paragraph generator, designed to meet the dynamic needs of today\'s digital storytellers and marketing geniuses. Get ready to be amazed by how effortless crafting compelling content can be!\\\"}\"', 114, 0, 8, 3, 3, NULL, NULL, '2024-02-26 08:01:33', '2024-02-26 08:01:33'),
(48, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate article about The Future of Artificial Intelligence in Healthcare. Focus on Artificial Intelligence, Healthcare, Future, Technology, Medical, Innovation, Machine Learning, Diagnosis, Treatment, Patient Care. Maximum 270 words. Creativity is 0.25 between 0 and 1. Language is  English . Generate 2 different articles. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"**Article 1: Revolutionizing Healthcare: The Emergence of Artificial Intelligence**\\\\\\\\n\\\\\\\\nIn the rapidly evolving field of healthcare, Artificial Intelligence (AI) is setting the stage for transformative changes, promising a future where medical diagnosis, treatment, and patient care are significantly enhanced. As we navigate through this era of technological innovation, AI, coupled with machine learning capabilities, is at the forefront of revolutionizing patient outcomes and operational efficiencies in healthcare settings.\\\\\\\\n\\\\\\\\nThe integration of AI in healthcare is redefining the approach towards diagnosing conditions with a higher degree of accuracy and at a much faster pace compared to traditional methods. Machine learning algorithms are being refined to analyze complex medical data, enabling early detection of diseases that were once challenging to diagnose. This leap in diagnostic capability not only saves crucial time but also drastically improves patient survival rates.\\\\\\\\n\\\\\\\\nMoreover, AI-driven innovations extend to patient treatment and care, where personalized medicine is becoming a reality. By analyzing vast amounts of patient data, AI algorithms can predict the most effective treatment plans tailored to individual patient needs, reducing side effects and improving health outcomes.\\\\\\\\n\\\\\\\\nAs we look to the future, the role of AI in healthcare is undeniably promising. Its ability to learn and adapt to new information will continuously improve medical practices. While challenges in ethics, privacy, and data security remain, the potential for AI to enhance every aspect of healthcare is immense. The journey towards a smarter, more efficient, and patient-centered healthcare system is well underway, thanks to the groundbreaking advancements in artificial intelligence.\\\\\\\\n\\\\\\\\n**Article 2: The Next Frontier in Healthcare: The Impact of Artificial Intelligence**\\\\\\\\n\\\\\\\\nThe advent of Artificial Intelligence (AI) in the healthcare sector underscores a future marked by groundbreaking innovations in diagnosis, treatment, and patient care. As we advance, the synergy between medical expertise and AI technology is poised to redefine healthcare dynamics, offering unprecedented precision and efficiency.\\\\\\\\n\\\\\\\\nAI\'s capability to process and analyze vast datasets far exceeds human capacity, enabling the development of machine learning models that can predict disease onset, progression, and treatment outcomes with remarkable accuracy. This paradigm shift in diagnosis and prognostication is paving the way for early interventions, significantly altering disease trajectories and enhancing patient survival.\\\\\\\\n\\\\\\\\nIn the realm of treatment, AI is spearheading the development of personalized medicine, where treatments are optimized for individual patient profiles. This not only enhances the efficacy of therapeutic interventions but also minimizes adverse reactions, heralding a new era of patient-centered healthcare.\\\\\\\\n\\\\\\\\nMoreover, AI is enhancing patient care through innovative solutions such as virtual health assistants and predictive healthcare maintenance. These tools are designed to provide constant support and monitoring, offering a more responsive and personalized healthcare experience.\\\\\\\\n\\\\\\\\nDespite the optimism, the integration of AI into healthcare presents its own set of challenges, including ethical considerations and the need for robust data protection measures. Nonetheless, the potential benefits of AI in improving healthcare outcomes, reducing costs, and enhancing patient experiences are undeniable.\\\\\\\\n\\\\\\\\nAs AI continues to evolve, its role in healthcare is set to deepen, marking a significant leap forward in medical science. Embracing AI\'s potential while navigating its challenges is key to unlocking the full spectrum of benefits it offers to the future of healthcare.\\\"}\"', 517, 0, 7, 3, 3, NULL, NULL, '2024-02-26 08:05:32', '2024-02-26 08:05:32');
INSERT INTO `history` (`id`, `user_id`, `type`, `history_data`, `word_count`, `image_count`, `template_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(49, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate article about The Impact of AI on E-Commerce: Trends and Insights. Focus on AI, E-Commerce, Impact, Trends, Insights, Online Shopping, Automation, Personalization, Customer Experience, Retail. Maximum 270 words. Creativity is 1 between 0 and 1. Language is  English . Generate 2 different articles. Tone of voice must be Excited\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"### Article 1: Revolutionizing Online Shopping: The AI Magic in E-Commerce!\\\\\\\\n\\\\\\\\n**Hello, E-Commerce Enthusiasts!**\\\\\\\\n\\\\\\\\nDive into the thrilling world of e-commerce, where AI is the new wizard, transforming every pixel of online shopping into a breathtaking experience! Imagine walking into an online store that knows you better than you know yourself - suggesting products you love, deals you can\'t resist, and surprises tailored just for you. That\'s AI, folks - turning every click into a journey of personalized wonder!\\\\\\\\n\\\\\\\\n**The Future is Now! Automation & Personalization Unleashed!**\\\\\\\\n\\\\\\\\nWith automation, AI is redefining convenience, making shopping as easy as blinking! Bots handle queries, transactions are smoother than silk, and inventory management is a dream. Personalization? It\'s on another level - AI is curating shopping experiences bespoke to each shopper\'s desires, leading to jaw-dropping customer loyalty.\\\\\\\\n\\\\\\\\n**Customer Experience: The AI-Powered Nirvana**\\\\\\\\n\\\\\\\\nRetailers, powered by AI, are now gods of customer satisfaction. Imagine, every visit to an online store feels like home, with AI ensuring you find what you need (and what you didn\'t know you needed), making every session a discovery of joy!\\\\\\\\n\\\\\\\\n**Fasten Your Seatbelts: The E-Commerce Evolution Awaits!**\\\\\\\\n\\\\\\\\nAs we rocket into the future, the fusion of AI and e-commerce is only getting stronger, promising a world where shopping online isn\'t just convenient, but a spellbinding experience. E-commerce warriors, the age of AI awaits your exploration, promising realms of possibilities. Let the magic begin!\\\\\\\\n\\\\\\\\n### Article 2: Get Ready to be Wowed: AI\'s Dazzling Impact on E-Commerce!\\\\\\\\n\\\\\\\\n**Hey There, Future-Forward Shoppers!**\\\\\\\\n\\\\\\\\nStep into the spotlight of the e-commerce stage where AI is the star, dazzling us with feats that turn shopping into an exhilarating adventure! Gone are the days of mundane online browsing. Now, it\'s a world where AI brings your desires to your doorstep, in a flourish of personalization and efficiency.\\\\\\\\n\\\\\\\\n**Personalization Like Never Before: Your Wish is AI\\u2019s Command!**\\\\\\\\n\\\\\\\\nAI\'s wizardry means understanding you deeper. Every click, every wish, is noted, leading to a shopping experience that feels like it\'s crafted by a personal genie. From bespoke product recommendations to tailor-made deals, AI makes your shopping desires its command!\\\\\\\\n\\\\\\\\n**Automation: The Silent Hero of Seamless Shopping**\\\\\\\\n\\\\\\\\nBehind the scenes, AI is the dynamo powering a revolution in how we shop. From lightning-fast customer service via chatbots to real-time inventory management, AI is the backbone of a frictionless e-commerce experience, making every moment online a breeze.\\\\\\\\n\\\\\\\\n**The Customer Experience: A Leap into the Future**\\\\\\\\n\\\\\\\\nPrepare for an e-commerce experience so intuitive, it feels like magic. AI ensures that every touchpoint with an online retailer is unforgettable, transforming routine shopping into moments of pure delight. Your digital retail journey, powered by AI, is nothing short of extraordinary.\\\\\\\\n\\\\\\\\n**E-Commerce Reimagined: The AI Era is Here!**\\\\\\\\n\\\\\\\\nAs AI continues to weave its magic across the e-commerce landscape, we\'re not just witnessing a transformation; we\'re part of an exciting journey into a future where technology and creativity merge to redefine what shopping online means. E-commerce aficionados, welcome to the exhilarating realm of endless possibilities with AI!\\\\\\\\n\\\\\\\\n**Let the Adventure Begin!**\\\"}\"', 487, 0, 7, 3, 3, NULL, NULL, '2024-02-26 08:06:31', '2024-02-26 08:06:31'),
(50, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate article about Understanding Neural Networks: A Beginner\'s Guide. Focus on Neural Networks, Beginners, Guide, Understanding, Deep Learning, Artificial Intelligence, Algorithms, Training, Applications, Basics. Maximum 300 words. Creativity is 1 between 0 and 1. Language is  English . Generate 2 different articles. Tone of voice must be Professional\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"### Article 1: Unveiling the Mysteries of Neural Networks: A Beginner\'s Guide\\\\\\\\n\\\\\\\\nNeural networks, a cornerstone of modern artificial intelligence (AI), are intriguing systems inspired by the human brain\'s architecture. Aimed at beginners, this guide sheds light on the fundamentals of neural networks and their significant role within the realm of deep learning and AI. At their core, neural networks comprise layers of interconnected nodes or \\\\\\\\neurons,\\\\\\\\ which process input data through a series of algorithms to produce an output. This unique structure enables the network to learn from data, adapting its internal parameters through a process known as training. \\\\\\\\n\\\\\\\\nThe training of a neural network involves adjusting weights and biases based on the difference between the actual output and the desired output, using algorithms such as backpropagation. This iterative optimization hones the network\'s ability to make predictions or recognize patterns with remarkable accuracy. The applications of neural networks are vast and varied, ranging from voice recognition systems and recommendation engines to more complex tasks like autonomous vehicles and medical diagnosis.\\\\\\\\n\\\\\\\\nFor those beginning their journey into understanding neural networks, it\'s crucial to grasp the basics: the architecture of layers, the importance of activation functions, the role of training data, and the choice of algorithms for optimization. Equipped with these fundamentals, one can delve deeper into the specialized realms of deep learning, exploring how neural networks can be layered to form deep neural networks, capable of learning from data in ways that mimic human intelligence. This brief exploration serves as a foundational step towards mastering the principles that underpin neural networks and unlocking their potential to solve complex problems in innovative ways.\\\\\\\\n\\\\\\\\n---\\\\\\\\n\\\\\\\\n### Article 2: Deciphering the Fundamentals of Neural Networks: A Guide for Beginners\\\\\\\\n\\\\\\\\nAt the intersection of artificial intelligence (AI) and machine learning lies the fascinating domain of neural networks. This beginner\'s guide is meticulously crafted to introduce the principles underlying neural networks and their profound implications in deep learning. Neural networks are essentially algorithms modeled after the human brain\'s neural structure, designed to recognize patterns and solve complex problems through learning.\\\\\\\\n\\\\\\\\nEmbarking on the exploration of neural networks, it\'s essential to understand their basic architecture. A neural network is composed of input, hidden, and output layers, each containing units or neurons connected by weighted pathways. These weights adjust during the training phase, where the network learns from vast datasets, refining its ability to make predictions or identify patterns. This self-optimization is the crux of a neural network\'s learning capability, facilitated by training algorithms like gradient descent.\\\\\\\\n\\\\\\\\nThe role of neural networks in advancing AI is unparalleled. They form the backbone of deep learning, where networks with multiple hidden layers can learn from data with extraordinary depth and complexity. This ability has spearheaded groundbreaking applications across various sectors, including but not limited to, speech recognition, image analysis, financial forecasting, and healthcare diagnostics.\\\\\\\\n\\\\\\\\nFor beginners keen on navigating the world of neural networks, mastering the basics remains key: understanding the layered structure, familiarizing with activation functions and the backpropagation algorithm, and recognizing the importance of comprehensive training data. As burgeoning AI enthusiasts and professionals delve into the intricacies of neural networks, they unlock the potential to leverage these powerful tools in crafting solutions that were once deemed impossible, marking a significant milestone in the journey of artificial intelligence.\\\"}\"', 542, 0, 7, 3, 3, NULL, NULL, '2024-02-26 08:07:57', '2024-02-26 08:07:57'),
(51, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate article about Tech Giants Under Scrutiny: Antitrust Investigations and Regulatory Measures. Focus on Tech giants, antitrust investigations, regulatory measures, Big Tech, monopolistic practices, competition law, digital marketplaces, consumer protection. Maximum 250 words. Creativity is 1 between 0 and 1. Language is  English . Generate 1 different articles. Tone of voice must be Casual\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"Hey there! Let\'s dive into the bustling world of tech giants and the magnifying glass they\'re under. Picture this: Big Tech companies, you know the ones - they practically run the digital universe. But with great power comes great scrutiny. Enter stage left: antitrust investigations and regulatory measures.\\\\\\\\n\\\\\\\\nSo, what\'s the big deal? Well, these tech behemoths stand accused of playing the game a bit too well, dominating the sandbox of digital marketplaces so much that the smaller kids can\'t even build a sandcastle. Whether it\'s gobbling up potential rivals before breakfast or locking in consumers so tight they can\'t see other products, the moves are monopolistic, say regulators.\\\\\\\\n\\\\\\\\nGovernments and competition watchdogs are cracking the whip with antitrust laws designed to promote fair play and protect us, the consumers. From the U.S. to the European Union, the message is clear: balance the scales, or we\'ll balance them for you. These investigations aim to crack open the doors to competition, giving innovators a fair shot and keeping prices and choices healthy for consumers.\\\\\\\\n\\\\\\\\nThe digital realm is a wild west, but with these modern sheriffs in town, there\'s hope yet for taming the unruly giants. As we watch this drama unfold, remember, it\'s all about keeping the digital playground fun and fair for everyone. Who said regulatory measures couldn\'t be exciting?\\\"}\"', 218, 0, 7, 3, 3, NULL, NULL, '2024-01-26 08:10:33', '2024-01-26 08:10:33'),
(52, 3, 'ai_writer', '\"{\\\"request_body\\\":{\\\"model\\\":\\\"gpt-4-0125-preview\\\",\\\"messages\\\":[{\\\"role\\\":\\\"system\\\",\\\"content\\\":\\\"You are a helpful assistant.\\\"},{\\\"role\\\":\\\"user\\\",\\\"content\\\":\\\"Generate article about Decadent Delights: Indulging in the World of Gourmet Chocolate. Focus on Food article, gourmet chocolate, indulgence, confectionery, artisanal treats, chocolate tasting. Maximum 250 words. Creativity is 1 between 0 and 1. Language is  English . Generate 2 different articles. Tone of voice must be Casual\\\"}],\\\"stream\\\":true},\\\"response_body\\\":\\\"**Taste the Bliss: Dive into Gourmet Chocolate Goodness**\\\\\\\\n\\\\\\\\nOh, the sheer joy of unwrapping a piece of gourmet chocolate! It\'s not just candy, folks\\u2014it\'s a journey. A bite of this heavenly confection sends you on an indulgent escapade, where every morsel speaks volumes of craftsmanship. Not your average supermarket find, gourmet chocolate is the Picasso of the confectionery world, molding the finest cocoa into masterpieces. From single-origin bars that boast of their bean\'s heritage to artisanal treats infused with exotic ingredients\\u2014each piece has a story. Chocolate tasting? Sign me up! It\'s like wine tasting, but you\'re swirling, sniffing, and savoring chocolate. Bitter, sweet, earthy, and everything in-between; it\'s a palette adventure. Indulge in the luxury of gourmet chocolate, and trust me, your tastebuds will thank you.\\\\\\\\n\\\\\\\\n---\\\\\\\\n\\\\\\\\n**Heaven in a Bite: The Gourmet Chocolate Experience**\\\\\\\\n\\\\\\\\nEver wonder why some chocolates make you close your eyes in delight? That\'s gourmet chocolate for you\\u2014rich, indulgent, and absolutely divine. This isn\'t just snacking; it\'s an experience. Artisanal chocolatiers pour their hearts into creating these confections, blending in flavors that push boundaries and excite the senses. Think lavender, sea salt, or even chili\\u2014flavors that dare you to take a bite. And when you do, oh, it\'s bliss. Each piece is a celebration of quality and creativity, far removed from the ordinary. Join a chocolate tasting, or better yet, host one. Discover layers of flavors, textures, and aromas. Gourmet chocolate isn\'t just food; it\'s a love language. Whether you\'re gifting or indulging solo, it\'s a journey worth taking. So, go ahead, lose yourself in the decadent world of gourmet chocolate. You deserve it.\\\"}\"', 264, 0, 7, 3, 3, NULL, NULL, '2024-02-26 08:11:49', '2024-02-26 08:11:49'),
(55, 3, 'ai_image', '{\"request_body\":{\"status\":true,\"upload_image\":[\"http://192.168.1.83:8000/storage/73/60A8R42Snuva64q19PHB1YEiAMDV0sEydu21GLgB.jpg\"],\"message\":\"User Upload Image List\"},\"response_body\":{}}', 0, 1, 0, 3, 3, NULL, NULL, '2024-02-26 13:53:51', '2024-02-26 13:53:51'),
(57, 3, 'ai_image', '\"{\"request_body\":{\"status\":true,\"upload_image\":[\"http://192.168.1.83:8000/storage/75/aY8uVpAYqFJnEJ887DELDKapfoHtC3jYLygEvm8t.png\"],\"message\":\"User Upload Image List\"},\"response_body\":{}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-01-27 04:29:42', '2024-01-27 04:29:42'),
(58, 3, 'ai_image', '\"{\"request_body\":{\"status\":true,\"upload_image\":[\"http://192.168.1.83:8000/storage/77/5COi7dSiwb4rYRuDpkOzEt7Rbeq2KzTjboLSlJYP.png\"],\"message\":\"User Upload Image List\"},\"response_body\":{}}\"', 0, 1, 0, 3, 3, NULL, NULL, '2024-02-15 04:30:10', '2024-02-15 04:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `history_image_mapping`
--

CREATE TABLE `history_image_mapping` (
  `id` bigint UNSIGNED NOT NULL,
  `history_id` int DEFAULT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_image_mapping`
--

INSERT INTO `history_image_mapping` (`id`, `history_id`, `image_url`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://192.168.1.83:8000/storage/53/Bgr5wGZRYhTtjKXGJH3DL0tosnfzL1GT7Te5ZcVp.png', 3, 3, NULL, NULL, '2024-02-26 05:39:11', '2024-02-26 05:39:12'),
(2, 2, 'http://192.168.1.83:8000/storage/54/PwvfQ9QIau9tBwlLHMCVBhBAJz3qsHB3AkqSNM4J.png', 3, 3, NULL, NULL, '2024-02-26 05:42:06', '2024-02-26 05:42:06'),
(3, 3, 'http://192.168.1.83:8000/storage/55/yIGIShawaV54KD7U3ucgsfcq3rdPj2GJQNVvHC6H.png', 3, 3, NULL, NULL, '2024-02-26 05:47:43', '2024-02-26 05:47:43'),
(5, 5, 'http://192.168.1.83:8000/storage/57/f4NmuNhaOcYwlLrlDhzm726XocsbE60uMRXz2Eh2.png', 3, 3, NULL, NULL, '2024-02-26 05:55:03', '2024-02-26 05:55:03'),
(8, 55, 'http://192.168.1.83:8000/storage/74/YgzBFCnUmuQBlLQtXCohWxZQ5z3HvRgUsOtUgc6Q.png', 3, 3, NULL, NULL, '2024-02-26 13:53:51', '2024-02-26 13:53:51'),
(9, 57, 'http://192.168.1.83:8000/storage/76/XW6nZtykE5JBq1dJ8UoMQQPQ1KFdC3Rxdg2V5622.png', 3, 3, NULL, NULL, '2024-02-27 04:29:42', '2024-02-27 04:29:42'),
(10, 58, 'http://192.168.1.83:8000/storage/78/UcgBppdi1ZL170v0ROMdg6LQeuHZrjYG7JWHeDAE.png', 3, 3, NULL, NULL, '2024-02-27 04:30:10', '2024-02-27 04:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `ip_address`
--

CREATE TABLE `ip_address` (
  `id` bigint UNSIGNED NOT NULL,
  `ip_address` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, '27920a13-13b4-42b6-9bc1-b09fa1cc47f7', 'profile_image', 'super_admin', 'WAoGHSN5HnsHW2jKz0KQFf2J2tmKKC2YLVqluB56.png', 'image/png', 'public', 'public', 111258, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(2, 'App\\Models\\User', 2, 'a2a8a41b-5a61-4716-aaaa-9eaac8f7bff6', 'profile_image', 'super_admin', '8hoRC2TQglfH8dp2hoHnhHwIWgk9mCJnvyBlLmUT.png', 'image/png', 'public', 'public', 111258, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(3, 'App\\Models\\User', 3, 'd696b040-88c6-4dd3-9606-32034364e84d', 'profile_image', 'emmanuel', 'VWUtKvp7zPILiyJa6Uf3iOZkeXPmexBNkLLteIpp.png', 'image/png', 'public', 'public', 400279, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(4, 'App\\Models\\User', 4, 'd53d8182-f70e-4272-bb7b-21bd8627dcd3', 'profile_image', 'andrew', 'wPea1Zx923OjisgmtKiwf7OujzXE00wD2ln3xKNl.png', 'image/png', 'public', 'public', 362698, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(5, 'App\\Models\\User', 5, 'b08a4ac3-2758-45c6-817c-b726e474d261', 'profile_image', 'jennifer', '1e55vFz9MeBdOriQdJKnNaXfSKxuYFVujUr55kEM.png', 'image/png', 'public', 'public', 598446, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(6, 'App\\Models\\User', 6, '4ef4c52a-3739-469e-8e1d-06e3d487471f', 'profile_image', 'danny', 'qMjZEYi2IoOhLOCOq321xUklcibHPqV6OZhetLFd.png', 'image/png', 'public', 'public', 508079, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(7, 'App\\Models\\User', 7, '06983c2a-a0ab-4462-86b9-a04593ac9811', 'profile_image', 'kahil', 'EsjYGKONoAksRITgjRPQaS80qi8uM82pycdQBzwW.png', 'image/png', 'public', 'public', 426708, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(8, 'App\\Models\\User', 8, 'cc6240b7-b580-4223-9ff3-6ebfe72aaafa', 'profile_image', 'beverly', 'zgcxiLMOm2UpPCvLi36reOlkYmBgC9hHqntm5n6A.png', 'image/png', 'public', 'public', 202197, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(9, 'App\\Models\\User', 9, '7f0c9d86-43a7-4527-b6e8-c92ec5b09e64', 'profile_image', 'erik', 'nQAgFGUfVuw31DoEUQFUAHdo23v4HfZjgLcA4IBS.png', 'image/png', 'public', 'public', 341412, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(10, 'App\\Models\\User', 10, '86b86d55-2f16-4847-ae70-c0f251215a23', 'profile_image', 'richard', 'gzeKVZlNv3EGmi7x2xioma0c3AxJnGwhNkbexbRD.png', 'image/png', 'public', 'public', 565592, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(11, 'App\\Models\\User', 11, '40a375c1-fe08-4984-bcf6-3d86ae06a320', 'profile_image', 'venesa', 'UfpXp8pfkcLOhcvvgwnNp4LjwOp6XgATJMdCwJCf.png', 'image/png', 'public', 'public', 806934, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(12, 'App\\Models\\User', 12, 'f273fc5c-661d-4576-9cc8-46624cae00a9', 'profile_image', 'jorge', 'vh9uLcv0yTIZQDredWq2lJEjdokkiHSeL7x7qkIi.png', 'image/png', 'public', 'public', 478166, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(13, 'App\\Models\\User', 13, '04b25c45-cfb9-4e0f-8f13-088ae28825c3', 'profile_image', 'daniel', 'uzjKdj3gbEU9IlIb3ZCxzIfLbddvtdun41vYq7Ct.png', 'image/png', 'public', 'public', 459650, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(14, 'App\\Models\\User', 14, '9b71f3e6-de3d-494e-aad1-a7a4cfeabc4f', 'profile_image', 'katie', '2Re9XLH7VIRQardecQWCANzVYUelnYf3WncGs7vx.png', 'image/png', 'public', 'public', 539981, '[]', '[]', '[]', '[]', 1, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(15, 'Modules\\Service\\Models\\SystemService', 1, '2b3d40c2-b48d-40b2-a7cf-d040c6e7717d', 'feature_image', 'ai_writer', 'JKBJI3cwIMNVRUWisjAhzcz7L2mNXQkjnIzRYrqX.jpg', 'image/jpeg', 'public', 'public', 151590, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:58', '2024-06-15 04:44:58'),
(16, 'Modules\\Service\\Models\\SystemService', 2, '1c49f7bf-2f43-46d1-9612-496f7730cf8e', 'feature_image', 'art_generator', 'oEGjQvozajmfL8uFWYO32S4pe2KHZXjldsN5PM8N.jpg', 'image/jpeg', 'public', 'public', 177238, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:58', '2024-06-15 04:44:59'),
(17, 'Modules\\Service\\Models\\SystemService', 3, '48d51153-6057-4996-884f-c7846d7b4441', 'feature_image', 'ai_image', 'ToRWG2ierQuMZmOjQi7d22LlzlKde3grTgucT7um.jpg', 'image/jpeg', 'public', 'public', 68752, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(18, 'Modules\\Service\\Models\\SystemService', 4, '94410f1e-6e41-4816-8cd8-59354ced1ec8', 'feature_image', 'ai_code', '3mZ2BUe4F2pdQRTNjmJe6XN6kwXwduRJFJf1xz9j.jpg', 'image/jpeg', 'public', 'public', 66400, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(19, 'Modules\\Service\\Models\\SystemService', 5, 'a24dd463-c6e5-4725-8ee4-923dd74e486a', 'feature_image', 'image_text', 'ZEEjWqXZFpB5CfnvpvRw4xRgb9HdFWsOQiE1gYoI.jpg', 'image/jpeg', 'public', 'public', 50038, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(20, 'Modules\\Service\\Models\\SystemService', 6, '2d6c3b46-232b-480b-9562-99dbda0f6b22', 'feature_image', 'ai_chat', 'ORzFJNwx2MU8C2ovgHnIPtz4H2QrJb4q97IWyksS.jpg', 'image/jpeg', 'public', 'public', 49746, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(21, 'Modules\\Slider\\Models\\Slider', 1, '82dd8ab2-72be-483b-828c-bba043a7e03a', 'feature_image', 'vetrinary', 'seKEs9DI93c7AG7vj2sIoHEhtgl2Z3lUmCg84yqC.png', 'image/png', 'public', 'public', 46716, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:00', '2024-06-15 04:45:00'),
(22, 'Modules\\Slider\\Models\\Slider', 2, 'a25e6dfe-0ed2-4cec-acc7-710b82f90f0d', 'feature_image', 'day care', 'wjkuTv6vxcqyv50F55HIn0K2tcBSEcN1HkaxrxNh.png', 'image/png', 'public', 'public', 46344, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:00', '2024-06-15 04:45:00'),
(23, 'Modules\\Slider\\Models\\Slider', 3, '76352d1d-7d3d-40d9-8930-b89464ddddcd', 'feature_image', 'grooming', 'ZnJDMZAdZWNaGiAhQAV5b2g6Kp3pOkO6azuq1dl5.png', 'image/png', 'public', 'public', 43689, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:00', '2024-06-15 04:45:00'),
(24, 'Modules\\Category\\Models\\Category', 1, '27994539-9cc1-47e6-988f-a77998b4f17d', 'feature_image', 'blog', 'UWoY9wTY4Fo8fQasuyT8qe4mivS2WnuNggKxwyTY.jpg', 'image/jpeg', 'public', 'public', 129607, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:00', '2024-06-15 04:45:01'),
(25, 'Modules\\Category\\Models\\Category', 2, '302e3b78-d6c5-46a9-b5ef-d4b8ba9d814b', 'feature_image', 'devlopment', 'JpGeYJRrCO7MvqdTeZX8RySm2CM7BUeyjJtpARbt.jpg', 'image/jpeg', 'public', 'public', 121744, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:01', '2024-06-15 04:45:01'),
(26, 'Modules\\Category\\Models\\Category', 3, '5f2dad57-d6b8-4937-b901-c76d3cf4be18', 'feature_image', 'Advertisement', '2ad6sUydHy76HxOUKSsDF7yf4BvtmsddlAHWMDmK.jpg', 'image/jpeg', 'public', 'public', 96352, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:01', '2024-06-15 04:45:01'),
(27, 'Modules\\Category\\Models\\Category', 4, '083bb524-42b3-406b-b783-851bdce108b3', 'feature_image', 'Social-media', 'eAanXWgrveG83zF70XsFF6Mqa6g4EQo49uMGrWri.jpg', 'image/jpeg', 'public', 'public', 140546, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(28, 'Modules\\Category\\Models\\Category', 5, 'f4670369-b679-4476-b3ee-4950ceb7d62a', 'feature_image', 'Photo-Enhancer', 'du9bbqACp5Sfry5ELTe1VICI6eGwjgWyfLQY9Lfm.jpg', 'image/jpeg', 'public', 'public', 315220, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(29, 'Modules\\Category\\Models\\Category', 6, '0ba41da4-a32c-4b09-99fa-d0ca286dbcb6', 'feature_image', 'Face-Enhancer', 'dni4A7cvkWZunH81gZXeH0H3mUpcp4PeVXjjg5PM.jpg', 'image/jpeg', 'public', 'public', 138614, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(30, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 1, 'e36ae777-4245-47a5-a16a-4701247f89a2', 'feature_image', 'blog', 'xepYlGrsooXcr3VqTVhcOjavf6Yp9o4KFed0KrvD.png', 'image/png', 'public', 'public', 1164, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:02', '2024-06-15 04:45:03'),
(31, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 2, 'bc055ebe-86d0-40d7-8beb-099f1fec7c3c', 'feature_image', 'youtube', 'v0oSbNqRyKsg2FOfVXMTUAfqzExDYzlYb22SOowu.png', 'image/png', 'public', 'public', 1388, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(32, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 3, 'bfd71496-e79a-418d-b028-63e0f070c210', 'feature_image', 'Pros and Cons', 'n9Hhwi7NAT8dmbPT29I4Y8RR9kH3D8o7wfG3PO5K.png', 'image/png', 'public', 'public', 1506, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(33, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 4, '37ebc99b-c73c-49a0-8eec-2ca2ab3808d7', 'feature_image', 'ads', 'dAXavbfSZiSkm3IceKTYgh508D1Fe5LdqiJwAnOz.png', 'image/png', 'public', 'public', 1540, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(34, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 5, '4902d4a1-4d89-4adc-a236-a240c9d11b6d', 'feature_image', 'Instagram Captions', 'jQbCLDOnnqLFGQEl1tmWsPr0fFzOZR8J79Jy9d2g.png', 'image/png', 'public', 'public', 1382, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(35, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 6, '7738e044-d7aa-49ae-8b8d-beb32eed2374', 'feature_image', 'Meta Description', '1lyatLhYkI9bVMnKe8qonbqSexHjSEAUDUKgnnYP.png', 'image/png', 'public', 'public', 1434, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(36, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 7, '6f26c5e7-0d08-4fe4-949d-7585f0522eb1', 'feature_image', 'article', 'dzssA8wNNUJxxonlpBoQOgNSKCZrH84oTsiFh96J.png', 'image/png', 'public', 'public', 1103, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(37, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 8, '42071ab7-140e-4c22-a494-3c11c7681161', 'feature_image', 'Paragraph', 'oKEunJfvimauj0EsUBU1KBfQ8a8ZSz4sK65FA8SO.png', 'image/png', 'public', 'public', 1157, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(38, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 9, '2b6b8bdc-0eda-4850-af98-74480e0bd954', 'feature_image', 'Grammar', 'nQAI7wPYpal70HNDOJLx3oAJ3aEIDpRRiJYFxVEk.png', 'image/png', 'public', 'public', 1314, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(39, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 10, '01b969b0-c3cb-4d9d-a82a-64f91093bd99', 'feature_image', 'TLDR', 'N2iYEC0jaGT6qPc6rjmqr4EU6S7jbbzsbNEi1nvS.png', 'image/png', 'public', 'public', 1023, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:03'),
(40, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 11, '17b22a20-d334-45e6-a84a-af677e8455bc', 'feature_image', 'ads', 'h5T1sCPQRLyIUsuF0n471B9ah7Fq0Epl7DtT21FT.png', 'image/png', 'public', 'public', 1540, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:03', '2024-06-15 04:45:04'),
(41, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 12, 'a831c713-54ee-4b43-8788-e0a4a0c7b8c6', 'feature_image', 'Social Media Post Business', 'Jgu5bI9VEF6K3IyVo1VKQXez9AwE6998oPijjLlo.png', 'image/png', 'public', 'public', 1443, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(42, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 13, '6ac1bc3a-ed8b-45bb-8b03-f5724af4491e', 'feature_image', 'Facebook Headlines', 'XNnQmC2Hh7T1I4K9vC4b2qvzwbe9uorOtDI2YOo9.png', 'image/png', 'public', 'public', 1262, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(43, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 14, 'b021609e-3240-4eaf-a726-e2da9a4202e4', 'feature_image', 'Social Media Post Tweet', 'LuvuuCSRBtWgQR4Cygosow2k7C1c8PMilEBOyQUD.png', 'image/png', 'public', 'public', 1474, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(44, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 15, '6dbfb6fa-5114-44de-a58d-82fe2a1a0087', 'feature_image', 'FAQ Generator', 'LE8PqukIAkxMlWFXS8XVxE4TkHoO6NfECjoot9sG.png', 'image/png', 'public', 'public', 1533, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(45, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 16, '9ba82da2-eaf8-4adb-a07d-e49f7db2e63a', 'feature_image', 'Instagram Hashtags', 'HOFvNGQYroqOXMVFrrgmL03LxsVrJjPyiDn9hd2i.png', 'image/png', 'public', 'public', 1147, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(46, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 17, '54b11f2f-6e72-4d07-b705-425f92836da9', 'feature_image', 'Testimonial Review', 'oNkm8nkbNUY93bLk160zqqgHtIQp8AXI3HbGUPZ7.png', 'image/png', 'public', 'public', 1498, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(47, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 18, 'b2891fbb-5f7b-4c7a-b5ab-7ca164c92952', 'feature_image', 'Email Generator', 'c2MWCwTvjOEwZTfmkdpta4rX6IZs5VCfqhhbpdv5.png', 'image/png', 'public', 'public', 1293, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(48, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 19, 'fb12a34b-dc2d-45b3-bda2-3892fdb66c34', 'feature_image', 'Email Answer Generator', 'VrQCw17mFJnuPkPhy81gTlgRtakhCmqJlyqL3a6S.png', 'image/png', 'public', 'public', 1401, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(49, 'Modules\\CustomTemplate\\Models\\CustomTemplate', 20, 'a0f6ca3c-2303-416f-9c40-220755cae885', 'feature_image', 'Newsletter', 'Ghe2CtXPhtkVW21JQSANg0HUanDqPDqzglqnejCQ.png', 'image/png', 'public', 'public', 1433, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:04'),
(50, 'App\\Models\\HistroyImageMapping', 1, '4a4010e8-50fb-452b-bdd2-8163f8125c14', 'history_image', 'history_image_1', 'WJ35WO6gwJl7ib6wPMlkn2ib3iwwIO274nIWbYbm.png', 'image/png', 'public', 'public', 3162696, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:04', '2024-06-15 04:45:05'),
(51, 'App\\Models\\HistroyImageMapping', 2, 'c479493f-37a5-4d18-be20-4a6b23093c64', 'history_image', 'history_image_2', 'yd5Ue5Vj04XSBQtyQw437tqobxDrzhcf8dmreCwC.png', 'image/png', 'public', 'public', 5523537, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:05', '2024-06-15 04:45:05'),
(52, 'App\\Models\\HistroyImageMapping', 3, '36ada693-8dfa-4d0d-9bb6-9f30569ca7b0', 'history_image', 'history_image_3', '2MJxJ27ezW9F5FPs9kdhGsBOa8nTHE4wqirLcy1A.png', 'image/png', 'public', 'public', 5522709, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:05', '2024-06-15 04:45:06'),
(53, 'App\\Models\\HistroyImageMapping', 5, '1293bd47-fac5-4817-8e38-8226df57534e', 'history_image', 'history_image_5', 'N4YHRz76EoGyCSkolM3U0d7Mfi6wdQZzW7tvi1Lr.png', 'image/png', 'public', 'public', 3162696, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:06', '2024-06-15 04:45:06'),
(54, 'App\\Models\\HistroyImageMapping', 8, 'e9fe7443-8c78-496e-bd5f-0680ad866f7b', 'history_image', 'history_image_6', 'IV6955aTo8ViafE8PxmN3uSm5Ax7okQrT5eKIQPl.png', 'image/png', 'public', 'public', 1195210, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:06', '2024-06-15 04:45:06'),
(55, 'App\\Models\\HistroyImageMapping', 9, 'e5ab0863-05eb-4fd1-872b-119de079dc92', 'history_image', 'history_image_7', 'UDre2kTGo5ZWyQiVNJKHpJyXZj1fhGlbTu3qPzuu.png', 'image/png', 'public', 'public', 1548858, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:06', '2024-06-15 04:45:07'),
(56, 'App\\Models\\HistroyImageMapping', 10, '5aec3faf-75d7-448b-8ba9-dcc5e30ad9c8', 'history_image', 'history_image_8', '64DXELnU7i0zvqj07hJrVqd2Zj9uarOSRjCtje3B.png', 'image/png', 'public', 'public', 1541150, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:07', '2024-06-15 04:45:07'),
(57, 'App\\Models\\ChatHistoryImage', 1, '875ab2e4-ff30-4609-b6e9-613cdcb9f5ee', 'upload_image', 'chat_image_1', '5iJRMraJGjoTK99V9N7dWwulx4Nv4dOlm61jcIuD.png', 'image/png', 'public', 'public', 536658, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:07', '2024-06-15 04:45:07'),
(58, 'App\\Models\\ChatHistoryImage', 2, '6f9df70f-4351-4d20-a4a1-3012f19869ac', 'upload_image', 'chat_image_2', '2360L8kB7MpwoD5Nalrb3yjOE3Wp1nxFYloTSivh.png', 'image/png', 'public', 'public', 896631, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:07', '2024-06-15 04:45:07'),
(59, 'App\\Models\\ChatHistoryImage', 3, '4ec49485-b78b-4d65-86cc-12c4d6f93356', 'upload_image', 'chat_image_3', 'pteICoHuGYSl8JIN4aHwKc28NRRlogdxAmMlFVgH.jpg', 'image/jpeg', 'public', 'public', 39932, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:07', '2024-06-15 04:45:07'),
(60, 'App\\Models\\ChatHistoryImage', 4, 'ac419582-5573-41b1-8c24-2fc5445b22ef', 'upload_image', 'chat_image_4', 'cptE7MEH4CY7ET8Xdo829Zh9gBBDL0FlhjoDfNqt.png', 'image/png', 'public', 'public', 992977, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:07', '2024-06-15 04:45:08'),
(61, 'App\\Models\\ChatHistoryImage', 5, '97d91d1b-91a8-439a-a0d8-fc26e919d611', 'upload_image', 'chat_image_5', '4DFwX9dAQuFENjXCDByfXfRMJ3QVP5g2oTPKRbBE.png', 'image/png', 'public', 'public', 518153, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:08', '2024-06-15 04:45:08'),
(62, 'App\\Models\\ChatHistoryImage', 6, 'a73a52ee-6a3e-4812-b0e4-1402a2c5e7e8', 'upload_image', 'chat_image_6', 'LjB8yyEEI1of6XHGtLJy1b2Zjvzlt9hWNqMPie4b.png', 'image/png', 'public', 'public', 518153, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:08', '2024-06-15 04:45:08'),
(63, 'App\\Models\\ChatHistoryImage', 7, 'f7b0f45d-d531-4c62-a1b2-3a25d35d7dfc', 'upload_image', 'chat_image_7', 'N0tjhcJ3OhuWowfGyJLO8AGJ4LAViHlYt4VtuwUr.png', 'image/png', 'public', 'public', 601040, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:08', '2024-06-15 04:45:08'),
(64, 'App\\Models\\ChatHistoryImage', 8, '133b17bc-050f-492e-8d4c-4bc4244ac6c4', 'upload_image', 'chat_image_8', 'yWFjYjw9ckkOD7ajaj9V4LzsTlTpVjU71s0zlQBB.png', 'image/png', 'public', 'public', 601040, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:08', '2024-06-15 04:45:08'),
(65, 'App\\Models\\ChatHistoryImage', 9, '5f60db2d-c2ad-4de0-9eef-28cc4c5dbcd1', 'upload_image', 'chat_image_9', 'xJVgyqtxZvUGllwDPIYwnaAPmDjzrrEevEk25hMc.png', 'image/png', 'public', 'public', 601040, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:08', '2024-06-15 04:45:09'),
(66, 'App\\Models\\ChatHistoryImage', 10, '06fc85f4-dbea-4bbb-92c3-895f9c1b3a6f', 'upload_image', 'chat_image_10', 'J80XvxXGMjzJDuGT8CqHLOoF1oJFFNLEwTePd1zx.png', 'image/png', 'public', 'public', 731785, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:09', '2024-06-15 04:45:09'),
(67, 'App\\Models\\ChatHistoryImage', 11, '5d4a233c-7cca-4c50-b766-6358227ff926', 'upload_image', 'chat_image_11', 'AqlTDmU5FVoRyUisOWS0hEZxRTk4UZfq52aTFb9X.jpg', 'image/jpeg', 'public', 'public', 176558, '[]', '[]', '{\"thumb\": true, \"thumb300\": true}', '[]', 1, '2024-06-15 04:45:09', '2024-06-15 04:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_08_08_100000_create_telescope_entries_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_01_01_000000_create_permission_tables', 1),
(4, '2023_01_01_000010_create_users_table', 1),
(5, '2023_01_01_000020_create_password_resets_table', 1),
(6, '2023_01_01_000040_create_settings_table', 1),
(7, '2023_01_01_000041_create_notifications_table', 1),
(8, '2023_01_01_000042_create_constants_table', 1),
(9, '2023_01_01_000200_create_media_table', 1),
(10, '2023_01_01_000400_create_activity_log_table', 1),
(11, '2023_01_27_190720_create_addresses_table', 1),
(12, '2023_04_11_120721_create_notificationtemplates_table', 1),
(13, '2023_04_11_140938_NotificationTemplateContentMapping', 1),
(14, '2023_04_27_113639_create_planlimitation_table', 1),
(15, '2023_05_02_111101_create_plan_table', 1),
(16, '2023_05_02_111622_create_planlimitation_mapping_table', 1),
(17, '2023_05_06_160755_create_subscriptions_table', 1),
(18, '2023_05_06_160843_create_subscriptions_transactions_table', 1),
(19, '2023_05_13_013137_create_categories_table', 1),
(20, '2023_05_14_154353_create_custom_fields_table', 1),
(21, '2023_05_15_101240_create_custom_fields_data_table', 1),
(22, '2023_05_15_101530_create_custom_field_groups_table', 1),
(23, '2023_05_16_111402_create_currencies_table', 1),
(24, '2023_06_09_014626_create_sliders_table', 1),
(25, '2023_06_17_062215_create_pages_table', 1),
(26, '2023_06_17_121725_create_jobs_table', 1),
(27, '2023_06_21_170019_create_user_profiles_table', 1),
(28, '2023_06_24_050019_create_modules_table', 1),
(29, '2023_08_29_054555_create_cities_table', 1),
(30, '2023_08_29_054601_create_states_table', 1),
(31, '2023_08_29_054608_create_countries_table', 1),
(32, '2024_01_08_065232_create_services_table', 1),
(33, '2024_01_08_082805_create_system_services_table', 1),
(34, '2024_01_25_045537_create_customtemplates_table', 1),
(35, '2024_02_07_070612_create_wishlist_templates_table', 1),
(36, '2024_02_09_085047_create_history_table', 1),
(37, '2024_02_10_045202_create_history_image_mapping_table', 1),
(38, '2024_02_14_120157_create_chat_history_table', 1),
(39, '2024_02_14_120354_create_chat_history_mapping_table', 1),
(40, '2024_02_19_104424_create_chat_history_image_table', 1),
(41, '2024_03_05_054106_create_ip_address_table', 1),
(42, '2024_03_05_111937_alter_planlimitation_table', 1),
(43, '2024_03_07_061007_alter_subscriptions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `more_permission` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `description`, `more_permission`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Syetem Service', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(2, 'Service', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(3, 'Category', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(4, 'subcategory', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(5, 'User', '', '[\"change_password\",\"send_notification\",\"subscribe_user\",\"paid_plan_expire_user\"]', 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(6, 'Subscriptions', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(7, 'Subscriptions Plan', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(8, 'CustomTemplate', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(9, 'Page', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(10, 'Notification', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(11, 'App Banner', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(12, 'Notification Template', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(13, 'Setting', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57'),
(14, 'Permission', '', NULL, 1, NULL, '2024-06-15 04:44:57', '2024-06-15 04:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` longtext COLLATE utf8mb4_unicode_ci,
  `bcc` longtext COLLATE utf8mb4_unicode_ci,
  `cc` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `channels` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `name`, `label`, `description`, `type`, `to`, `bcc`, `cc`, `status`, `channels`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'change_password', 'Change Password', NULL, 'change_password', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(2, 'forget_email_password', 'Forget Email/Password', NULL, 'forget_email_password', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(3, 'subscription_plan_expire', 'Subscription Plan Expire', NULL, 'subscription_plan_expire', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(4, 'recharge_reminder', 'Recharge Reminder', NULL, 'recharge_reminder', '[\"admin\",\"demo_admin\"]', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(5, 'new_subscription', 'New User Subscribed', NULL, 'new_subscription', '[\"admin\",\"demo_admin\",\"user\"]', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_template_content_mapping`
--

CREATE TABLE `notification_template_content_mapping` (
  `id` int UNSIGNED NOT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_detail` longtext COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_template_content_mapping`
--

INSERT INTO `notification_template_content_mapping` (`id`, `template_id`, `language`, `template_detail`, `subject`, `notification_message`, `notification_link`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', '\n            <p>Subject: Password Change Confirmation</p>\n            <p>Dear [[ user_name ]],</p>\n            <p>&nbsp;</p>\n            <p>We wanted to inform you that a recent password change has been made for your account. If you did not initiate this change, please take immediate action to secure your account.</p>\n            <p>&nbsp;</p>\n            <p>To regain control and secure your account:</p>\n            <p>&nbsp;</p>\n            <p>Visit [[ link ]].</p>\n            <p>Follow the instructions to verify your identity.</p>\n            <p>Create a strong and unique password.</p>\n            <p>Update passwords for any other accounts using similar credentials.</p>\n            <p>If you have any concerns or need assistance, please contact our customer support team.</p>\n            <p>&nbsp;</p>\n            <p>Thank you for your attention to this matter.</p>\n            <p>&nbsp;</p>\n            <p>Best regards,</p>\n            <p>[[ logged_in_user_fullname ]]<br />[[ logged_in_user_role ]]<br />[[ company_name ]]</p>\n            <p>[[ company_contact_info ]]</p>\n          ', 'Change Password', '', '', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(2, 2, 'en', '\n            <p>Subject: Password Reset Instructions</p>\n            <p>&nbsp;</p>\n            <p>Dear [[ user_name ]],</p>\n            <p>A password reset request has been initiated for your account. To reset your password:</p>\n            <p>&nbsp;</p>\n            <p>Visit [[ link ]].</p>\n            <p>Enter your email address.</p>\n            <p>Follow the instructions provided to complete the reset process.</p>\n            <p>If you did not request this reset or need assistance, please contact our support team.</p>\n            <p>&nbsp;</p>\n            <p>Thank you.</p>\n            <p>&nbsp;</p>\n            <p>Best regards,</p>\n            <p>[[ logged_in_user_fullname ]]<br />[[ logged_in_user_role ]]<br />[[ company_name ]]</p>\n            <p>[[ company_contact_info ]]</p>\n            <p>&nbsp;</p>\n          ', 'Forget Email/Password', '', '', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(3, 3, 'en', '\n            <p>Subject: Expiring Subscription Email</p>\n            <p>&nbsp;</p>\n            <p>Dear [[ user_name ]],</p>\n            <p>Your subscription plan is expiring soon. Please renew your subscription plan within the next 7 days to continue enjoying our services.</p>\n            <p>&nbsp;</p>\n            <p>Thank you.</p>\n            <p>&nbsp;</p>\n            <p>Best regards,</p>\n            <p>&nbsp;</p>\n          ', 'Subscription Plan Expire', '', '', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(4, 4, 'en', '\n            <p>Subject: Recharge Reminder </p>\n            <p>&nbsp;</p>\n            <p>Dear [[ user_name ]],</p>\n            <p>Important Notification: Your [[ service_name ]] account balance is insufficient. Please recharge your account to maintain service availability.</p>\n            <p>&nbsp;</p>\n            <p>Thank you.</p>\n            <p>&nbsp;</p>\n            <p>Best regards,</p>\n            <p>&nbsp;</p>\n          ', 'Recharge Reminder: Maintain Connectivity', '', '', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(5, 5, 'en', 'A new user has subscribed', 'New User is subscribe!', 'A new user has subscribed', '', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `type`, `sequence`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Privacy Policy', 'privacy-policy', 'privacy-policy', 1, '<p>This Privacy Policy is brought by Iqonic Design. Iqonic Design is the sole owner of a number of demo websites containing previews of WordPress website themes. This Privacy Policy shall apply to all Iqonic Design sites where this Privacy Policy is featured. This Privacy Policy describes how the Iqonic Design collects, uses, shares and secures personal information that you provide.</p><p>Iqonic Design does not share personal information of any kind with anyone. We will not sell or rent your name or personal information to any third party. We do not sell, rent or provide outside access to our mailing list or any data we store. Any data that a user stores via our facilities is wholly owned by that user or business. At any time, a user or business is free to take their data and leave, or to simply delete their data from our facilities.</p><p>Iqonic Design only collects specific personal information that is necessary for you to access and use our services. This personal information includes, but is not limited to, first and last name, email address, Country of residence.</p><p>Iqonic Design may release personal information if Iqonic Design is required to by law, search warrant, subpoena, court order or fraud investigation. We may also use personal information in a manner that does not identify you specifically nor allow you to be contacted but does identify certain criteria about our site’s users in general (such as we may inform third parties about the number of registered users, number of unique visitors, and the pages most frequently browsed).</p><p>&nbsp;</p><h5>Use of Information</h5><p><br></p><p>We use the information to enable your use of the site and its features and to assure security of use and prevent any potential abuse. We may use the information that we collect for a variety of purposes including:</p><p><strong>Promotion</strong>&nbsp;— With your consent we send promotional communications, such as providing you with information about products and services, features, surveys, newsletters, offers, promotions, contests and events;</p><p><strong>Safety and security</strong>&nbsp;— We use the information we have to verify accounts and activities, combat harmful conduct, detect and prevent spam and other bad experiences, maintain the integrity of the Platform, and promote safety and security.</p><p><strong>Product research and development</strong>&nbsp;— We use the information we have to develop, test and improve our Platform and Services, by conducting surveys and research, and testing and troubleshooting new products and features.</p><p><strong>Communication with you</strong>&nbsp;— We use the information we have to send you various communications, communicate with you about our products, and let you know about our policies and terms. We also use your information to respond to you when you contact us.</p><p>&nbsp;</p><h5>Amendments</h5><p><br></p><p>We may amend this Privacy Policy from time to time. When we amend this Privacy Policy, we will update this page accordingly and require you to accept the amendments in order to be permitted to continue using our services.</p><h5><br></h5><h5>Contact Us</h5><p>You can learn more about how privacy works within our site by contacting us. If you have questions about this Policy, you can contact us via email address provided. Additionally, we may also resolve any disputes you have with us in connection with our privacy policies and practices through direct contact. Write to us at&nbsp;<em>jagyemang@intellijai.net</em></p>', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(2, 'Terms & Conditions', 'terms-conditions', 'terms-conditions', 2, '<p>By accessing products on this site and placing an order from our website, you confirm that you are in agreement with and bound by the terms and conditions presented and outlined here. These terms apply to the entire website and any email or other type of communication between you and Iqonic Design. The Iqonic Design team is not liable for any direct, indirect, incidental or consequential damages, including, but not limited to, loss of data or profit, arising out of the use the materials on this site.</p><p>Iqonic Design will not be responsible for any outcome that may occur during the course of usage of our resources. We reserve the rights to change prices and revise the resources usage policy in any moment.</p><p>&nbsp;</p><h5><strong>Products</strong></h5><p><br></p><p>All products and services offered on this site are produced by Iqonic Design. You can access your download from your respective dashboard. We do not provide support for 3rd party software, plugins or libraries that you might have used with our products.</p><p>&nbsp;</p><h5>Security</h5><p><br></p><p>Iqonic Design does not process any order payments through the website. All payments are processed securely through RazorPay and Stripe, a third party online payment providers.</p><p>&nbsp;</p><h5>Cookie Policy</h5><p><br></p><p>A cookie is a file containing an identifier (a string of letters and numbers) that is sent by a web server to a web browser and is stored by the browser. The identifier is then sent back to the server each time the browser requests a page from the server. Our website uses cookies. By using our website and agreeing to this policy, you consent to our use of cookies in accordance with the terms of this policy.</p><p>We use session cookies to personalize the website for each user.</p><p>We use Google Analytics to analyze the use of our website. Our analytics service provider generates statistical and other information about website use by means of cookies. Deleting cookies will have a negative impact on the usability of the site. If you block cookies, you will not be able to use all the features on our website.</p><p>&nbsp;</p><h5>Refunds</h5><p><br></p><p>You can ask for refund against the item purchased under certain circumstances listed in our Refund Policy. In the event that you meet the applicable mark for receiving refund, Iqonic Design will issue you a refund and ask you to specify how the product turned down your item performance expectations.</p><p>&nbsp;</p><h5>Email</h5><p><br></p><p>By signing up on our website https://intellijai.net you agree to receive emails from us – Transactional as well as promotional (occasional).</p><p>&nbsp;</p><h5>Ownership</h5><p><br></p><p>Ownership of the product is governed by the usage license.</p><p>&nbsp;</p><h5>Changes about terms</h5><p><br></p><p>We may change/update our terms of use without any prior notice. If we change our terms and condition, we will post those changes on this page. Users can check latest version in here.</p>', 1, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `is_fixed`, `created_at`, `updated_at`) VALUES
(1, 'edit_settings', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(2, 'view_logs', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(3, 'view_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(4, 'add_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(5, 'edit_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(6, 'delete_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(7, 'add_assign_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(8, 'view_category', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(9, 'add_category', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(10, 'edit_category', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(11, 'delete_category', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(12, 'view_subcategory', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(13, 'add_subcategory', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(14, 'edit_subcategory', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(15, 'delete_subcategory', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(16, 'view_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(17, 'add_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(18, 'edit_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(19, 'delete_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(20, 'view_change_password', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(21, 'view_send_notification', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(22, 'view_subscribe_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(23, 'view_paid_plan_expire_user', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(24, 'view_syetem_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(25, 'add_syetem_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(26, 'edit_syetem_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(27, 'delete_syetem_service', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(28, 'view_subscriptions', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(29, 'view_subscriptions_plan', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(30, 'add_subscriptions_plan', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(31, 'edit_subscriptions_plan', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(32, 'delete_subscriptions_plan', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(33, 'view_customtemplate', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(34, 'add_customtemplate', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(35, 'edit_customtemplate', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(36, 'delete_customtemplate', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(37, 'view_page', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(38, 'add_page', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(39, 'edit_page', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(40, 'delete_page', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(41, 'view_setting', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(42, 'add_setting', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(43, 'edit_setting', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(44, 'delete_setting', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(45, 'view_notification', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(46, 'add_notification', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(47, 'edit_notification', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(48, 'delete_notification', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(49, 'view_notification_template', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(50, 'add_notification_template', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(51, 'edit_notification_template', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(52, 'delete_notification_template', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(53, 'view_app_banner', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(54, 'add_app_banner', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(55, 'edit_app_banner', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(56, 'delete_app_banner', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(57, 'view_permission', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(58, 'edit_permission', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` longtext COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '1',
  `amount` int DEFAULT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `trial_period` int NOT NULL DEFAULT '0',
  `planlimitation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `type`, `duration`, `amount`, `identifier`, `status`, `trial_period`, `planlimitation`, `description`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Free', 'Monthly', 1, 0, 'free', 1, 0, 'Unlimited', 'Get started with our free plan: access basic features and resources without spending a dime, empowering you to explore and innovate.', NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(2, 'Premium', 'Yearly', 1, 20, 'premium', 1, 0, 'Limited', 'Unlock the full potential with our premium plan, offering advanced features and exclusive benefits.', NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `planlimitation`
--

CREATE TABLE `planlimitation` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planlimitation`
--

INSERT INTO `planlimitation` (`id`, `name`, `limit`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`, `type`, `limit_type`, `key`) VALUES
(1, 'AI Image Generate Limit', 10, 1, 1, 1, NULL, '2024-03-07 02:56:31', '2024-03-07 02:56:31', NULL, 'ai_image', 'system_service', 'image_count'),
(2, 'AI Art Generate Limit', 10, 1, 1, 1, NULL, '2024-03-07 02:56:59', '2024-03-07 02:56:59', NULL, 'ai_art_generator', 'system_service', 'image_count'),
(3, 'AI Writer Generate Limit', 10000, 1, 1, 1, NULL, '2024-03-07 02:57:32', '2024-03-07 02:57:32', NULL, 'ai_writer', 'system_service', 'word_count'),
(4, 'AI Chat Generate Limit', 10000, 1, 1, 1, NULL, '2024-03-07 02:58:25', '2024-03-07 02:58:25', NULL, 'ai_chat', 'system_service', 'word_count'),
(5, 'AI Code Generate Limit', 10000, 1, 1, 1, NULL, '2024-03-07 02:58:57', '2024-03-07 02:58:57', NULL, 'ai_code', 'system_service', 'word_count'),
(6, 'AI Imge to Text Generate Limit', 10000, 1, 1, 1, NULL, '2024-03-07 02:59:40', '2024-03-07 02:59:40', NULL, 'ai_image_text', 'system_service', 'word_count'),
(7, 'AI Image Generate Limit', 1, 1, 1, 1, NULL, '2024-03-07 02:56:31', '2024-03-07 02:56:31', NULL, 'ai_image', 'system_service', 'image_count'),
(8, 'AI Art Generate Limit', 1, 1, 1, 1, NULL, '2024-03-07 02:56:59', '2024-03-07 02:56:59', NULL, 'ai_art_generator', 'system_service', 'image_count'),
(9, 'AI Writer Generate Limit', 100, 1, 1, 1, NULL, '2024-03-07 02:57:32', '2024-03-07 02:57:32', NULL, 'ai_writer', 'system_service', 'word_count'),
(10, 'AI Chat Generate Limit', 100, 1, 1, 1, NULL, '2024-03-07 02:58:25', '2024-03-07 02:58:25', NULL, 'ai_chat', 'system_service', 'word_count'),
(11, 'AI Code Generate Limit', 100, 1, 1, 1, NULL, '2024-03-07 02:58:57', '2024-03-07 02:58:57', NULL, 'ai_code', 'system_service', 'word_count'),
(12, 'AI Imge to Text Generate Limit', 100, 1, 1, 1, NULL, '2024-03-07 02:59:40', '2024-03-07 02:59:40', NULL, 'ai_image_text', 'system_service', 'word_count');

-- --------------------------------------------------------

--
-- Table structure for table `planlimitation_mapping`
--

CREATE TABLE `planlimitation_mapping` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` int DEFAULT NULL,
  `planlimitation_id` int DEFAULT NULL,
  `limit` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planlimitation_mapping`
--

INSERT INTO `planlimitation_mapping` (`id`, `plan_id`, `planlimitation_id`, `limit`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 10, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(2, 2, 2, 10, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(3, 2, 3, 10000, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(4, 2, 4, 10000, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(5, 2, 5, 10000, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(6, 2, 6, 10000, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(7, 1, 7, 1, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(8, 1, 8, 1, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(9, 1, 9, 100, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(10, 1, 10, 100, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(11, 1, 11, 100, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24'),
(12, 1, 12, 100, NULL, NULL, NULL, NULL, '2024-03-07 03:05:24', '2024-03-07 03:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `title`, `guard_name`, `is_fixed`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(2, 'demo_admin', 'Demo Admin', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53'),
(3, 'user', 'Customer', 'web', 1, '2024-06-15 04:44:53', '2024-06-15 04:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `type`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'slot_duration', '00:15', 'text', NULL, NULL, NULL, '2024-06-15 04:44:53', '2024-06-15 04:44:53', NULL),
(2, 'is_one_signal_notification', '1', 'integaration', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(3, 'onesignal_app_id', '39911fbe-db1f-40bf-bc3e-f08003903be5', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(4, 'onesignal_rest_api_key', 'NmIyNjcxMjctYjMxNi00YTEwLWI3OTMtZjhlOTMyNjEwZjlm', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(5, 'onesignal_channel_id', '3460faef-fe36-429d-8f18-b26953d3986f', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(6, 'employee_onesignal_app_id', 'd4582b0b-66ce-414a-9a6c-71cda188a6f3', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(7, 'employee_onesignal_rest_api_key', 'ZDI4YzY4YjEtZGI0YS00ZGRjLWIwYWItNDVmMzdkYzE2YmE3', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(8, 'employee_onesignal_channel_id', '7094d3a3-686a-4814-9e94-8c093b9053ac', 'mobile_config', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(9, 'is_application_link', '1', 'integaration', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(10, 'customer_app_play_store', 'PLAY STOR', 'is_application_link', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(11, 'customer_app_app_store', 'APP STOR', 'is_application_link', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(12, 'employee_app_play_store', 'https://play.google.com/store/apps/details?id=com.pawlly.employee', 'is_application_link', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(13, 'employee_app_app_store', 'https://apps.apple.com/us/app/pawlly-for-employee/id6462849036', 'is_application_link', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(14, 'is_zoom', '1', 'integaration', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(15, 'account_id', 'WJHpsUd9TKKt99vWOKqeig', 'is_zoom', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(16, 'client_id', 'AcILlYbFS2ajeVjFPQMdwg', 'is_zoom', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(17, 'client_secret', '150kB12FZyJ5W4AHoDi1EpwG9mCrxJX9', 'is_zoom', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(18, 'razor_payment_method', '1', 'razorpayPayment', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(19, 'razorpay_secretkey', 'rzp_test_CLw7tH3O3P5eQM', 'razor_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(20, 'razorpay_publickey', 'rzp_test_CLw7tH3O3P5eQM', 'razor_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(21, 'str_payment_method', '1', 'stripePayment', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(22, 'stripe_secretkey', 'sk_test_CG2JhAIXvVWDeFUFqtUizO4N00zmvm7o8J', 'str_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(23, 'stripe_publickey', 'pk_test_HtQwwWoE9b43mfy5km6ThSPN00xunQv8J9', 'str_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(24, 'paystack_payment_method', '1', 'paystackPayment', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(25, 'paystack_secretkey', 'sk_test_9b5bf65070d9773c7a2b3aa7dd8d41310c5fc03c', 'paystack_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(26, 'paystack_publickey', 'pk_test_8c41a6f40d2753586db092fbe22320ac8eda874d', 'paystack_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(27, 'paypal_payment_method', '1', 'paypalPayment', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(28, 'paypal_secretkey', 'EGvqxtKeQIK5LIPbYLuWTMLoCtqzuoNaFUEvaltLlW2Ka58OwTg5fiv_QuD_fhjguk4RsCExBGpvxu7u', 'paypal_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(29, 'paypal_clientid', 'AepfSIAvfjV4DCulR7pzq2baaxjpkt0vcl0CBJt-YFKaQ6i7fwSY6LubCPtftIGXBX4elIvUL-aPyB2e', 'paypal_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(30, 'flutterwave_payment_method', '1', 'flutterwavePayment', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(31, 'flutterwave_secretkey', 'FLWSECK_TEST-76e58fc4d85dd2c3fc01ea7ef5b9e2bb-X', 'flutterwave_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(32, 'flutterwave_publickey', 'FLWPUBK_TEST-0e16d1deea10a74762ea18fd0bf5be1c-X', 'flutterwave_payment_method', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(33, 'is_event', '1', 'other_settings', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(34, 'is_blog', '1', 'other_settings', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(35, 'is_user_push_notification', '1', 'other_settings', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(36, 'is_provider_push_notification', '1', 'other_settings', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(37, 'default_time_zone', 'Asia/Kolkata', 'misc', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(38, 'notification', 'firebase_notification', 'other_settings', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(39, 'firebase_key', 'FIREBASE_KEY', 'firebase_notification', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(40, 'enable_picsart', '1', 'enablePicsArt', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(41, 'picsart_key', 'PICSART_KEY', 'enable_picsart', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(42, 'enable_cutoutpro', '1', 'enableCutoutPro', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(43, 'cutoutpro_key', 'CUTOUTPRO_KEY', 'enable_cutoutpro', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(44, 'enable_gemini', '1', 'enableGemini', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(45, 'gemini_key', 'GEMINI_KEY', 'enable_gemini', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL),
(46, 'daily_limit', '5', 'daily_limit', NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'category',
  `link_id` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `status`, `link`, `type`, `link_id`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, '1', 'category', NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(2, NULL, 1, '1', 'category', NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL),
(3, NULL, 1, '4', 'category', NULL, NULL, NULL, NULL, '2024-06-15 04:45:00', '2024-06-15 04:45:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `planlimits` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `plan_id`, `user_id`, `start_date`, `end_date`, `status`, `amount`, `name`, `identifier`, `type`, `duration`, `plan_type`, `payment_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `planlimits`) VALUES
(1, 1, 3, '2024-01-22 08:35:14', '2024-02-22 08:36:14', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 1, NULL, NULL, NULL, NULL, '2024-01-22 03:05:14', '2024-01-22 03:05:14', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(2, 1, 4, '2024-01-28 08:44:03', '2024-02-28 08:44:03', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 2, NULL, NULL, NULL, NULL, '2024-01-28 03:14:03', '2024-01-28 03:14:03', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(3, 1, 5, '2023-03-05 08:59:59', '2023-04-05 08:59:59', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 3, NULL, NULL, NULL, NULL, '2023-03-05 03:29:59', '2023-03-05 03:29:59', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(4, 1, 6, '2023-06-05 08:59:59', '2023-07-05 08:59:59', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 4, NULL, NULL, NULL, NULL, '2024-02-24 03:32:40', '2024-02-24 03:32:40', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(5, 1, 12, '2023-04-15 08:59:59', '2023-05-15 08:59:59', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 5, NULL, NULL, NULL, NULL, '2024-02-24 03:34:21', '2024-02-24 03:34:21', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(6, 1, 9, '2023-06-15 08:59:59', '2023-07-15 08:59:59', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 6, NULL, NULL, NULL, NULL, '2024-02-24 03:36:47', '2024-02-24 03:36:47', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(7, 1, 7, '2023-04-25 08:59:59', '2023-05-25 08:59:59', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 7, NULL, NULL, NULL, NULL, '2024-02-24 03:39:03', '2024-02-24 03:39:03', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]'),
(8, 1, 11, '2024-02-24 09:11:07', '2024-03-24 09:12:07', 'active', 0, 'Free', 'free', 'Monthly', 1, 'Unlimited', 8, NULL, NULL, NULL, NULL, '2024-02-24 03:41:07', '2024-02-24 03:41:07', '[{\"id\":1,\"planlimitation_id\":7,\"limitation_title\":\"AI Image Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":2,\"planlimitation_id\":8,\"limitation_title\":\"AI Art Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_art_generator\",\"limit\":1,\"key\":\"image_count\",\"status\":1},{\"id\":3,\"planlimitation_id\":9,\"limitation_title\":\"AI Writer Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_writer\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":4,\"planlimitation_id\":10,\"limitation_title\":\"AI Chat Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_chat\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":5,\"planlimitation_id\":11,\"limitation_title\":\"AI Code Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_code\",\"limit\":100,\"key\":\"word_count\",\"status\":1},{\"id\":6,\"planlimitation_id\":12,\"limitation_title\":\"AI Image to Text Generate Limit\",\"limit_type\":\"system_service\",\"type\":\"ai_image_text\",\"limit\":100,\"key\":\"word_count\",\"status\":1}]');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions_transactions`
--

CREATE TABLE `subscriptions_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `subscriptions_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_transactions_details` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions_transactions`
--

INSERT INTO `subscriptions_transactions` (`id`, `subscriptions_id`, `user_id`, `amount`, `payment_type`, `payment_status`, `transaction_id`, `other_transactions_details`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0, 'stripe', 'paid', 'pi_1OnGh1FTMa5P8ht0pEWTzG1e', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(2, 2, 4, 0, 'stripe', 'paid', 'pi_1OnGpRFTMa5P8ht0g6ohV6ua', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(3, 3, 5, 0, 'stripe', 'paid', 'pi_1OnH4yFTMa5P8ht05TMPnJmI', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(4, 4, 6, 0, 'stripe', 'paid', 'pi_1OnH7aFTMa5P8ht0MZopyOgk', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(5, 5, 12, 0, 'stripe', 'paid', 'pi_1OnH9DFTMa5P8ht0qlv5eOGL', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(6, 6, 9, 0, 'stripe', 'paid', 'pi_1OnHBYFTMa5P8ht0UJGfnyw6', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(7, 7, 7, 0, 'stripe', 'paid', 'pi_1OnHDkFTMa5P8ht0ZCk4sP0K', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02'),
(8, 8, 11, 0, 'stripe', 'paid', 'pi_1OnHFkFTMa5P8ht0Z6WoJkPi', NULL, NULL, NULL, NULL, NULL, '2024-06-15 04:45:02', '2024-06-15 04:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `system_services`
--

CREATE TABLE `system_services` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_services`
--

INSERT INTO `system_services` (`id`, `slug`, `type`, `name`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ai-writer', 'ai_writer', 'AI Writer', 'Revolutionizing the writing process with the ingenuity of artificial intelligence, seamlessly crafting compelling narratives, insightful articles, and engaging content with precision and efficiency.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58'),
(2, 'ai-art-generator', 'ai_art_generator', 'AI Art Generator', 'Dive into a realm where artificial intelligence converges with the canvas, crafting captivating and innovative artworks that redefine the landscape of traditional artistry.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:58', '2024-06-15 04:44:58'),
(3, 'ai-image', 'ai_image', 'AI Image', 'Experience the fusion of creativity and technology as artificial intelligence transforms pixels into breathtaking visual masterpieces, redefining the essence of imagery with unparalleled innovation.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(4, 'ai-code', 'ai_code', 'AI Code', 'Unlock the power of AI to revolutionize your codebase, enhancing productivity and unlocking new possibilities in software development.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(5, 'ai-image-to-text', 'ai_image_text', 'AI Image To Text', 'Convert images to text effortlessly with AI, bridging visual content with written communication seamlessly.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59'),
(6, 'ai-chat', 'ai_chat', 'AI Chat', 'AI Chat: Seamlessly interact with virtual agents, experiencing responsive and intuitive dialogue.', 1, NULL, NULL, NULL, NULL, '2024-06-15 04:44:59', '2024-06-15 04:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `is_subscribe` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `login_type`, `gender`, `date_of_birth`, `email_verified_at`, `password`, `avatar`, `is_banned`, `is_subscribe`, `status`, `last_notification_seen`, `address`, `user_type`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super', 'Admin', 'admin@intellijai.net', '44-5289568745', NULL, 'male', '2012-12-19', '2024-06-15 04:44:54', '$2y$10$kh7fCN8kotPE6A1fdEbF7.abzdJY1tSGIx8kbLKRWPOUDjxOrRZW.', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'admin', NULL, '2024-06-15 04:44:54', '2024-06-15 04:44:54', NULL),
(2, 'Jayson', 'Agyemang', 'jagyemang@intellijai.net', '44-5289568745', NULL, 'male', '1979-04-28', '2024-06-15 04:44:54', '$2y$10$Rsh09uClmFzj21acoqAFhOV9nkDyOYNVO64Fel/GHWy5fPxI23WqW', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'demo_admin', NULL, '2024-06-15 04:44:54', '2024-06-15 04:44:54', NULL),
(3, 'Kumah', 'James', 'jameskumah@gmail.com', '1-4578952512', NULL, 'male', '1987-12-27', '2024-06-15 04:44:54', '$2y$10$WrOv3j401ip7LopwafKCNuHngKoqNALzWd1RkrtoxP7PJ17brDQiS', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-06-15 04:44:54', '2024-06-15 04:44:54', NULL),
(4, 'Eddy', 'Oboh', 'eddyoboh@gmail.com', '1-7485961545', NULL, 'male', '1972-09-26', '2024-06-15 04:44:54', '$2y$10$ibkg002D2qLfbpP1/KlOyuyZYWREuW0ZoKocOgllUkhcXVR9ubRWq', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-01-20 03:41:07', '2024-06-15 04:44:54', NULL),
(5, 'Gabriel', 'Owusu Ansah', 'gk.ansah100@gmail.com', '1-7485961545', NULL, 'male', '2020-01-30', '2024-06-15 04:44:54', '$2y$10$ZSD65YFODksxhYPmhf8fB.32Y0bdisxbHlKomDRx0Q2qfwDGDznQq', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-01-22 03:41:07', '2024-06-15 04:44:54', NULL),
(6, 'Okoro', 'Chisom Amaka', 'okorochisom@gmail.com', '1-7485961545', NULL, 'male', '1973-04-29', '2024-06-15 04:44:54', '$2y$10$j4jd21LKjJJcB3WFDr/9JeqcrclT7aIZQYgn9qYOSYZDkRtJ.ZGw2', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-01-29 03:41:07', '2024-06-15 04:44:54', NULL),
(7, 'Emmanuel', 'Nkrumah', 'emmanuelnkrumah@gmail.com', '1-7485961545', NULL, 'male', '1981-12-13', '2024-06-15 04:44:54', '$2y$10$j8BhFeRxJQtX59OBPdJXA.IrFxjBdkzuzaHptKxobS5TGXsmUuI4S', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-01-31 03:41:07', '2024-06-15 04:44:54', NULL),
(8, 'Priscilla', 'Coffee', 'priscillacoffee@gmail.com', '1-7485961545', NULL, 'male', '2011-03-16', '2024-06-15 04:44:54', '$2y$10$9qZzT1W/w9WqvSq0b1fysOV4161twkGsdiLb9dp83YlFpxMiSUyUm', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-02 03:41:07', '2024-06-15 04:44:54', NULL),
(9, 'Jackeline', 'Pedro', 'jackelinepedro@gmail.com', '1-7485961545', NULL, 'male', '2023-12-24', '2024-06-15 04:44:55', '$2y$10$XeX0jnUlbTwL3K0Vc9v9l.fir3C3ep.Q9KJtgD008mo3wsbfHZjqC', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-08 03:41:07', '2024-06-15 04:44:55', NULL),
(10, 'Yvonne', 'Opoku', 'yvonneopoku@gmail.com', '1-7485961545', NULL, 'male', '2011-09-19', '2024-06-15 04:44:55', '$2y$10$KsswOCDhlmCQKQFHYsgd/uMxQI3U9QAE4.CxMpmZCJXmSd1nX3fti', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-13 03:41:07', '2024-06-15 04:44:55', NULL),
(11, 'Vanessa', 'Nkrumah', 'vanessankrumah@gmail.com', '1-7485961545', NULL, 'male', '1985-05-01', '2024-06-15 04:44:55', '$2y$10$8jrUHdpg6MLiSwvSTWqKae9nbOndfjoWDazsq1vRipyU.tO1jazpK', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-18 03:41:07', '2024-06-15 04:44:55', NULL),
(12, 'Metolo', 'Foyet', 'ladyf@gmail.com', '1-7485961545', NULL, 'male', '2024-05-27', '2024-06-15 04:44:55', '$2y$10$vTdG.YGFakJErG2Cwk9vn.76c6McnREawyFmEb72ZukiEPgyKWwqa', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-22 03:41:07', '2024-06-15 04:44:55', NULL),
(13, 'Faithful', 'Obeng Mframa', 'faithfulobeng@gmail.com', '1-7485961545', NULL, 'male', '2008-05-20', '2024-06-15 04:44:55', '$2y$10$nw/iG1IGOEPd0zXYqOJbwO61xJC08MbQd5idkjcSkTwZe1l88DwZa', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-24 03:41:07', '2024-06-15 04:44:55', NULL),
(14, 'Delia', 'Agyemang', 'katie@gmail.com', '1-7485961545', NULL, 'male', '2015-11-25', '2024-06-15 04:44:55', '$2y$10$AkEpvk.bLO0vvtOhXigTGu8OE72PQD4xLbmKPRlvmyT69L2LJjo0u', 'img/avatar/male.webp', 0, 0, 1, NULL, NULL, 'user', NULL, '2024-02-29 03:41:07', '2024-06-15 04:44:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `about_self` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expert` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dribbble_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_templates`
--

CREATE TABLE `wishlist_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_addressable_type_addressable_id_index` (`addressable_type`,`addressable_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_history_image`
--
ALTER TABLE `chat_history_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_history_mapping`
--
ALTER TABLE `chat_history_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `constants`
--
ALTER TABLE `constants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customtemplates`
--
ALTER TABLE `customtemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_image_mapping`
--
ALTER TABLE `history_image_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_address`
--
ALTER TABLE `ip_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template_content_mapping`
--
ALTER TABLE `notification_template_content_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planlimitation`
--
ALTER TABLE `planlimitation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planlimitation_mapping`
--
ALTER TABLE `planlimitation_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions_transactions`
--
ALTER TABLE `subscriptions_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_services`
--
ALTER TABLE `system_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_templates`
--
ALTER TABLE `wishlist_templates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_history_image`
--
ALTER TABLE `chat_history_image`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_history_mapping`
--
ALTER TABLE `chat_history_mapping`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `constants`
--
ALTER TABLE `constants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customtemplates`
--
ALTER TABLE `customtemplates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `history_image_mapping`
--
ALTER TABLE `history_image_mapping`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ip_address`
--
ALTER TABLE `ip_address`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification_template_content_mapping`
--
ALTER TABLE `notification_template_content_mapping`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `planlimitation`
--
ALTER TABLE `planlimitation`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `planlimitation_mapping`
--
ALTER TABLE `planlimitation_mapping`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscriptions_transactions`
--
ALTER TABLE `subscriptions_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_services`
--
ALTER TABLE `system_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_templates`
--
ALTER TABLE `wishlist_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
