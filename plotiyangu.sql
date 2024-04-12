-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2024 at 12:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plotiyangu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add caretaker', 1, 'add_caretaker'),
(2, 'Can change caretaker', 1, 'change_caretaker'),
(3, 'Can delete caretaker', 1, 'delete_caretaker'),
(4, 'Can view caretaker', 1, 'view_caretaker'),
(5, 'Can add contract', 2, 'add_contract'),
(6, 'Can change contract', 2, 'change_contract'),
(7, 'Can delete contract', 2, 'delete_contract'),
(8, 'Can view contract', 2, 'view_contract'),
(9, 'Can add property', 3, 'add_property'),
(10, 'Can change property', 3, 'change_property'),
(11, 'Can delete property', 3, 'delete_property'),
(12, 'Can view property', 3, 'view_property'),
(13, 'Can add tenant', 4, 'add_tenant'),
(14, 'Can change tenant', 4, 'change_tenant'),
(15, 'Can delete tenant', 4, 'delete_tenant'),
(16, 'Can view tenant', 4, 'view_tenant'),
(17, 'Can add custom user', 5, 'add_customuser'),
(18, 'Can change custom user', 5, 'change_customuser'),
(19, 'Can delete custom user', 5, 'delete_customuser'),
(20, 'Can view custom user', 5, 'view_customuser'),
(21, 'Can add payment', 6, 'add_payment'),
(22, 'Can change payment', 6, 'change_payment'),
(23, 'Can delete payment', 6, 'delete_payment'),
(24, 'Can view payment', 6, 'view_payment'),
(25, 'Can add unit', 7, 'add_unit'),
(26, 'Can change unit', 7, 'change_unit'),
(27, 'Can delete unit', 7, 'delete_unit'),
(28, 'Can view unit', 7, 'view_unit'),
(29, 'Can add Theme', 8, 'add_theme'),
(30, 'Can change Theme', 8, 'change_theme'),
(31, 'Can delete Theme', 8, 'delete_theme'),
(32, 'Can view Theme', 8, 'view_theme'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(5, '2024-03-28 09:30:58.725184', '3', 'admin', 2, '[{\"changed\": {\"fields\": [\"User type\"]}}]', 5, 3),
(6, '2024-03-28 10:06:50.055733', '3', 'Landlord', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 5, 3),
(7, '2024-03-28 10:38:33.023816', '4', 'Cesar.Bergstrom72', 1, '[{\"added\": {}}]', 5, 3),
(8, '2024-03-28 10:39:06.884127', '5', 'Jan.Yundt10', 1, '[{\"added\": {}}]', 5, 3),
(9, '2024-03-28 10:39:32.019342', '6', 'Kristian59', 1, '[{\"added\": {}}]', 5, 3),
(10, '2024-03-28 10:40:05.684136', '7', 'Jeanette_Hackett', 1, '[{\"added\": {}}]', 5, 3),
(11, '2024-03-28 10:40:29.463818', '8', 'Boyd55', 1, '[{\"added\": {}}]', 5, 3),
(12, '2024-03-28 10:40:54.344131', '9', 'Myron.Ryan', 1, '[{\"added\": {}}]', 5, 3),
(13, '2024-03-28 10:41:38.359691', '10', 'Fletcher.Dicki', 1, '[{\"added\": {}}]', 5, 3),
(14, '2024-03-28 10:41:57.505565', '11', 'Damian_McKenzie44', 1, '[{\"added\": {}}]', 5, 3),
(15, '2024-03-28 10:42:28.163218', '12', 'Dudley_Spinka26', 1, '[{\"added\": {}}]', 5, 3),
(16, '2024-03-28 10:43:05.737630', '13', 'Delmer.Gerlach', 1, '[{\"added\": {}}]', 5, 3),
(17, '2024-03-28 10:53:33.414001', '14', 'Eugenia_Harber39', 1, '[{\"added\": {}}]', 5, 3),
(18, '2024-03-28 10:53:53.024086', '15', 'Edison40', 1, '[{\"added\": {}}]', 5, 3),
(19, '2024-03-28 10:54:20.738028', '16', 'Susana88', 1, '[{\"added\": {}}]', 5, 3),
(20, '2024-03-28 10:54:42.713880', '17', 'Beatrice69', 1, '[{\"added\": {}}]', 5, 3),
(21, '2024-03-28 10:54:58.347948', '18', 'Jessica38', 1, '[{\"added\": {}}]', 5, 3),
(22, '2024-03-28 10:55:18.866489', '19', 'Katrina_Tromp', 1, '[{\"added\": {}}]', 5, 3),
(23, '2024-03-28 10:55:36.693022', '20', 'Tomasa.Leannon16', 1, '[{\"added\": {}}]', 5, 3),
(24, '2024-03-28 10:55:57.943770', '21', 'Pete97', 1, '[{\"added\": {}}]', 5, 3),
(25, '2024-03-28 10:56:28.122105', '22', 'Lue21', 1, '[{\"added\": {}}]', 5, 3),
(26, '2024-03-28 10:56:47.793043', '23', 'Cyril.Fritsch', 1, '[{\"added\": {}}]', 5, 3),
(27, '2024-03-28 10:57:05.604564', '24', 'Makenzie84', 1, '[{\"added\": {}}]', 5, 3),
(28, '2024-03-30 08:29:02.627220', 'P2', 'Limuru Flex Apartments', 1, '[{\"added\": {}}]', 3, 3),
(29, '2024-03-31 08:11:25.357887', '3', 'Sarah Landlord', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 5, 3),
(30, '2024-04-03 12:42:40.840060', '3', 'Sarah', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'admin', 'logentry'),
(8, 'admin_interface', 'theme'),
(11, 'auth', 'group'),
(10, 'auth', 'permission'),
(12, 'contenttypes', 'contenttype'),
(1, 'property', 'caretaker'),
(2, 'property', 'contract'),
(5, 'property', 'customuser'),
(6, 'property', 'payment'),
(3, 'property', 'property'),
(4, 'property', 'tenant'),
(7, 'property', 'unit'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-28 09:11:31.188468'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-03-28 09:11:32.367957'),
(3, 'auth', '0001_initial', '2024-03-28 09:11:41.379997'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-03-28 09:11:44.580400'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-03-28 09:11:44.997039'),
(6, 'auth', '0004_alter_user_username_opts', '2024-03-28 09:11:45.310635'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-03-28 09:11:45.598995'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-03-28 09:11:45.772491'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-03-28 09:11:45.962986'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-03-28 09:11:46.116512'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-03-28 09:11:46.276746'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-03-28 09:11:46.645031'),
(13, 'auth', '0011_update_proxy_permissions', '2024-03-28 09:11:46.750583'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-03-28 09:11:46.849793'),
(15, 'property', '0001_initial', '2024-03-28 09:12:23.816121'),
(16, 'admin', '0001_initial', '2024-03-28 09:12:29.935832'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-03-28 09:12:30.066821'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-28 09:12:30.348574'),
(19, 'admin_interface', '0001_initial', '2024-03-28 09:12:31.028517'),
(20, 'admin_interface', '0002_add_related_modal', '2024-03-28 09:12:31.882829'),
(21, 'admin_interface', '0003_add_logo_color', '2024-03-28 09:12:32.427641'),
(22, 'admin_interface', '0004_rename_title_color', '2024-03-28 09:12:32.749164'),
(23, 'admin_interface', '0005_add_recent_actions_visible', '2024-03-28 09:12:33.537533'),
(24, 'admin_interface', '0006_bytes_to_str', '2024-03-28 09:12:33.861253'),
(25, 'admin_interface', '0007_add_favicon', '2024-03-28 09:12:34.284865'),
(26, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2024-03-28 09:12:34.979539'),
(27, 'admin_interface', '0009_add_enviroment', '2024-03-28 09:12:35.333913'),
(28, 'admin_interface', '0010_add_localization', '2024-03-28 09:12:35.461946'),
(29, 'admin_interface', '0011_add_environment_options', '2024-03-28 09:12:36.223837'),
(30, 'admin_interface', '0012_update_verbose_names', '2024-03-28 09:12:36.277426'),
(31, 'admin_interface', '0013_add_related_modal_close_button', '2024-03-28 09:12:36.463064'),
(32, 'admin_interface', '0014_name_unique', '2024-03-28 09:12:36.762925'),
(33, 'admin_interface', '0015_add_language_chooser_active', '2024-03-28 09:12:37.048834'),
(34, 'admin_interface', '0016_add_language_chooser_display', '2024-03-28 09:12:37.414366'),
(35, 'admin_interface', '0017_change_list_filter_dropdown', '2024-03-28 09:12:37.472113'),
(36, 'admin_interface', '0018_theme_list_filter_sticky', '2024-03-28 09:12:37.613447'),
(37, 'admin_interface', '0019_add_form_sticky', '2024-03-28 09:12:37.940331'),
(38, 'admin_interface', '0020_module_selected_colors', '2024-03-28 09:12:38.993009'),
(39, 'admin_interface', '0021_file_extension_validator', '2024-03-28 09:12:39.166389'),
(40, 'admin_interface', '0022_add_logo_max_width_and_height', '2024-03-28 09:12:39.719652'),
(41, 'admin_interface', '0023_theme_foldable_apps', '2024-03-28 09:12:40.200780'),
(42, 'admin_interface', '0024_remove_theme_css', '2024-03-28 09:12:40.464941'),
(43, 'admin_interface', '0025_theme_language_chooser_control', '2024-03-28 09:12:40.745202'),
(44, 'admin_interface', '0026_theme_list_filter_highlight', '2024-03-28 09:12:40.958541'),
(45, 'admin_interface', '0027_theme_list_filter_removal_links', '2024-03-28 09:12:41.381091'),
(46, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2024-03-28 09:12:41.915227'),
(47, 'admin_interface', '0029_theme_css_generic_link_active_color', '2024-03-28 09:12:42.147867'),
(48, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2024-03-28 09:12:43.282188'),
(49, 'property', '0002_alter_customuser_options_alter_customuser_managers_and_more', '2024-03-28 09:12:45.347915'),
(50, 'sessions', '0001_initial', '2024-03-28 09:12:46.784877'),
(51, 'property', '0003_alter_tenant_profile_pic', '2024-04-03 11:25:58.552909'),
(52, 'property', '0004_alter_tenant_profile_pic', '2024-04-03 11:43:41.763747'),
(53, 'property', '0005_alter_tenant_profile_pic', '2024-04-03 11:50:09.030212'),
(54, 'property', '0006_alter_tenant_profile_pic', '2024-04-03 12:02:03.159444');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('19ma390xefc7rh4bl98928adpwfrbopf', '.eJxVjEEOgjAQRe_StWlapkzRpXvOQKbTGYsaSCisjHdXEha6_e-9_zIDbWsZtirLMGZzMa05_W6J-CHTDvKdpttseZ7WZUx2V-xBq-3nLM_r4f4dFKrlW6trHHtEyuiSNCLMSAqdqtcWKfo2pHMDiCwQFELHAEkdhBxdilHM-wP5xzgt:1rqJAa:gQuENkEdRXBEeOcUbT1Gtj2Zp_1u__hrJxeQK5dTaDw', '2024-03-29 21:49:48.173952'),
('2asw3rjsj1z8kiq4m1vsj1ijc2jkcjio', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rrbkP:TN3OdcVFQSy4FQm3u0ahA0NAjks9pi4KnKjbZfJ1flY', '2024-04-02 11:52:09.557285'),
('2m8qtudwxgzrovk8pfbwoh93sui7jkgl', '.eJxVjEEOgjAQRe_StWlapkzBpXvP0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcWcTW9Ov1smfsi0g3Kn6TZbnqd1GbPdFXvQaq9zkeflcP8OBqrDt1bXOPaIVNBlaUSYkRQ6Va8tUvRtyH0DiCwQFELHAFkdhBJdjlHM-wP8Kzgx:1rppnE:HM5Wh3Ws3JoDK39kzHIaWHsWtMTybOs3Jjlmln1a3Yg', '2024-03-28 14:27:44.305538'),
('2muf467p7sxbebwftti4woo0h9v6z7as', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-Q4Ni2gVupnhbg7VOoCtm9m3stk2tY-b4vMeajmYkJjTr9jIX7IuJN6p_E2WZ7GdR6K3RV70MV2U5Xn9XD_Dnpa-m-tLjj2iFTRFQkizEgKrarXBin5JpZzAEQWiAqxZYCiDmJNrqQk5v0BHmE4Xw:1rt3XV:oNYFLQNvGrWkNm2rOR_hcjy_c2jhYICgP0V4Ag4aoZI', '2024-04-06 11:44:49.729160'),
('4yt29i8q2kzm9q81l9ki9ioex0cqkdp5', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rseSD:P4nEefvpTYJ0pdmM_0NGa2R8IcoEMGszHRbIERgpLy8', '2024-04-05 08:57:41.385631'),
('5919y7y6m6adk8e047cq7mlw5aapdswm', '.eJxVjEEOwiAQRe_C2hBowCku3XsGMsNMpWogKe2q8e5K0oVu_3v_7Sritua4NVnizOqiBqtOvyNhekrphB9Y7lWnWtZlJt0VfdCmb5XldT3cv0DGlntXzARIEBzbYM4TS0A0QQwk4yX5AJbZkx0pgSFPaRD4fmB0NoDzrN4fGcY4OQ:1rpsCK:uGgSj8jLL1NZ6864GRSoeTMvhcip2LLW3Wlpq2_K580', '2024-03-28 17:01:48.252713'),
('70c5x1ordknhhr0c1an24p02otsucrci', '.eJxVjEEOgjAQRe_StWlapkzBpXvP0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcWcTW9Ov1smfsi0g3Kn6TZbnqd1GbPdFXvQaq9zkeflcP8OBqrDt1bXOPaIVNBlaUSYkRQ6Va8tUvRtyH0DiCwQFELHAFkdhBJdjlHM-wP8Kzgx:1rqtji:4v3GD3f8qJ9C9E19ICWau4Vx3pkKbtltGmqSNfkbics', '2024-03-31 12:52:30.959959'),
('7c8f5uddaup01dlyoa6tsezhcaa28bhu', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-U4NimgVupnhbg7VOoCtm9m3sv0tK213xaZ-6GYi_HJnH7HTPyQcSflTuNtsjyN6zxkuyv2oIvtpiLP6-H-HVRa6rdWFxx7RCrosgQRZiSFVtVrg5R8E_M5ACILRIXYMkBWB7Ekl1MS8_4AHvk4YA:1rpsJu:GoG3Z1aw7i_4WlyZbpYFr-KLajseJYx49vpR3OmQjog', '2024-03-28 17:09:38.571640'),
('88al4ssk61vq3gfd3g6j29iyo9xr9xm2', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-U4NimgVupnhbg7VOoCtm9m3sv0tK213xaZ-6GYi_FoTr9jJn7IuJNyp_E2WZ7GdR6y3RV70MV2U5Hn9XD_Diot9VurC449IhV0WYIIM5JCq-q1QUq-ifkcAJEFokJsGSCrg1iSyymJeX8AHmA4Xw:1rppWK:z0eTxYaZkiuHQy8s2N9zeqK_tk73qjK9IonkgbQZukM', '2024-03-28 14:10:16.111467'),
('95j9l5d5imglgm64twsc72lmfcazbpv7', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqqxG:NZvYxPP_DNBLpD2S0VdAYuL5M-E-l7rI2HjmeWTxntY', '2024-03-31 09:54:18.636418'),
('aspm1csyqymwbs2ycdgjvy6p7w77claq', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqrYo:z8P-OzH3eGvnTMregr93GS23gNAzfrQp0ns-vD1_cy8', '2024-03-31 10:33:06.105159'),
('bio8o3g51bn5eqrd2xpg8c4blegs67gw', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rpq0G:eCMhsV_1ZLB80dn4Eu6RtGINeczMKtBcLNs1Y752ZE8', '2024-03-28 14:41:12.464266'),
('cg0eysb1jv3aco6eret1tt63zgtl19do', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rsdCi:AkOqCimyIc54fEPjEQcqMsNgkh69lt7vDF9pA5ZjbGA', '2024-04-05 07:37:36.890896'),
('djtqtrliyp9jcd6l7ov8w8l7czp599r2', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqzcj:PpD6U3GwVgk5FFtz-jfzuUqtLuKOO5Fkd9IE-hunD7E', '2024-03-31 19:09:41.242139'),
('ewvhn907v99kanh3db8sw0lzarlc7emd', 'e30:1rqy49:K_N160O73DCAEQ81BU79pftCSD6crAviNrG3fD2p1bE', '2024-03-31 17:29:53.740423'),
('f1zghfetviw45py2m31tgcoe74cbqu35', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rsgkq:ItbECdh5r1Z-s43BiActDvB2hYvQAyMj-IJn6gmQae4', '2024-04-05 11:25:04.670988'),
('f2erfcv2wlvl7femkkbxjcsmbhyeskc9', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rrBjz:A-NjC95BpmWYcQXbVFoeoc9AhXkCI7qcgUpXCEl2XlQ', '2024-04-01 08:05:59.692915'),
('f5v9j64sugvsiu1d2un4uoy7eu4syevs', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rsfds:iWVPNJFF__XaRlUiHBXmqwoex8oxXfCYsJ0AUsPSN1s', '2024-04-05 10:13:48.734407'),
('gvfnshb871chik7hepc3321l34npjefn', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rrIs5:fHGIZxgXgtp7iyR-1x5YaIDpucwrmC8UUXEcv2TU37E', '2024-04-01 15:42:49.821102'),
('gzu423m08ajnhmynqft8awzpfzhl5b3v', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rvBwx:zIUSCrqma777Oihud7eDdfWmOL430MDzHOvio5Qs-zQ', '2024-04-12 09:07:55.473519'),
('hcijlo9iyk95cnq7ytbxbbqrmofsf9y6', '.eJxVjEEOgjAQRe_StWlapkzRpXvOQKbTGYsaSCisjHdXEha6_e-9_zIDbWsZtirLMGZzMa05_W6J-CHTDvKdpttseZ7WZUx2V-xBq-3nLM_r4f4dFKrlW6trHHtEyuiSNCLMSAqdqtcWKfo2pHMDiCwQFELHAEkdhBxdilHM-wP5xzgt:1rppzU:4TMQ7j-aKVGUwkCQX2LhDNQV8U6Wbm0J6BNYSk2fyE0', '2024-03-28 14:40:24.131423'),
('im3dt9ph4cj8mg8hxn0nbsogdk6eronm', '.eJxVjEEOgjAQRe_StWlapkzBpXvP0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcWcTW9Ov1smfsi0g3Kn6TZbnqd1GbPdFXvQaq9zkeflcP8OBqrDt1bXOPaIVNBlaUSYkRQ6Va8tUvRtyH0DiCwQFELHAFkdhBJdjlHM-wP8Kzgx:1rps9r:D1Jgh5w7gkXkLNyIJSnWHeNHzVFvPd05EhsLetK3nAo', '2024-03-28 16:59:15.779722'),
('iqcc4lb8sghmjl50d5ccgauvhrm5ngln', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rrkUV:adeBBHv1RyZ1AsMf_mLKirPgvBWwhA_LgMSU5MuVl48', '2024-04-02 21:12:19.685923'),
('j5d6g4kfgip0k1dv3mcelyejzq94ofeg', '.eJxVjEEOwiAQRe_C2hBowCku3XsGMsNMpWogKe2q8e5K0oVu_3v_7Sritua4NVnizOqiBqtOvyNhekrphB9Y7lWnWtZlJt0VfdCmb5XldT3cv0DGlntXzARIEBzbYM4TS0A0QQwk4yX5AJbZkx0pgSFPaRD4fmB0NoDzrN4fGcY4OQ:1rppXa:ol_hsWnFRk3JVwKt84HqBv7DxjEQP-ix63hf9mf-DHc', '2024-03-28 14:11:34.580477'),
('k71wu4nj13dgqn8a6i5683jnaykqq2i6', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqJAz:bZp0iw0HDRgNEuSg6g5XtW5xwavjdGd_FjWHLhClKrI', '2024-03-29 21:50:13.342874'),
('lhqh7ox570cuvxhnx1jsfl6h8bktruoi', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rprgu:eSw4uXoE7ntdNJUlNYHyp3Hw-M0C6l6zWTZPMv0pHBQ', '2024-03-28 16:29:20.743106'),
('ln6uzifa3hr9bm376nat3avho79o0p1p', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqU8W:O9AxSDqMHr526cx3m-fPtwB0rYJ0eaxhwF4ZmcS8tQo', '2024-03-30 09:32:24.646286'),
('mn71uacxx9ci02xpllp9uavdbxu9jwle', '.eJxVjEEOgjAQRe_StWkKU6bVpXvOQKbTGYsaSCisjHdXEha6_e-9_zIDbWsZtirLMGZzMdGcfrdE_JBpB_lO0222PE_rMia7K_ag1fZzluf1cP8OCtXyrdW1jhtEyuiStCLMSApRtdEOKTSdT-cWEFnAK_jIAEkd-BxcCkHM-wP7kjgw:1rsjSz:V3Qke3BlXRuxalQmxN9-xad67ZvxQGFkhhZMOeL8mTA', '2024-04-05 14:18:49.585405'),
('mqb14ajn0f4anrzylhfx2u23709dbfzg', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rvE8N:b29L6GFxxW1yqSMFJKJNVOp0IV2Zcf3bxry2sVkdE38', '2024-04-12 11:27:51.946530'),
('mt3xmaemgb6ctqj2m6balpvi3o68sage', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqVTc:3rzOlqiHx5qQr6YK2kQu5RoTrgG_oIHOKFoNszgofp0', '2024-03-30 10:58:16.975439'),
('o4gvtf6mzl9x21u9fyz8c9r8fa3ogn5e', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcTDCn3y0TP2TaQbnTdJstz9O6jNnuij1otf1c5Hk93L-DgerwrdU1jj0iFXRZGhFmJIVO1WuLFH0b8rkBRBYICqFjgKwOQokuxyjm_QH5Ljgs:1rri1k:51nPvEPUUhrC-uJKvo821Ls7M3Ph4DUkNDHommABiYs', '2024-04-02 18:34:28.141881'),
('ox9ccykxt4aaykpb0gkt2gllrq8q7fpo', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-U4NimgVupnhbg7VOoCtm9m3sv0tK213xaZ-6GYi_FoTr9jJn7IuJNyp_E2WZ7GdR6y3RV70MV2U5Hn9XD_Diot9VurC449IhV0WYIIM5JCq-q1QUq-ifkcAJEFokJsGSCrg1iSyymJeX8AHmA4Xw:1rprgc:jmTxIsblqM8pftWuKBQb_ZMY0EGFVpjwERM39u1typg', '2024-03-28 16:29:02.774486'),
('oxhmaax6wl19wvd9992ksb8aionddjju', '.eJxVjDsOwjAQBe_iGln-4piSPmewdr0bHEC2FCcV4u4QKQW0b2beSyTY1pK2zkuaSVyE8eL0OyLkB9ed0B3qrcnc6rrMKHdFHrTLsRE_r4f7d1Cgl289cVCeQkQDg_aYjdZgkWlAZ6x13lBkpEgG3eStcgTBMaFS8cxB5yDeHxX7OFo:1rqU6N:dvMEQ5FnFeR_m5JW4gav3c_H_lZ7Tmx6aLi083qpXps', '2024-03-30 09:30:11.894094'),
('qtsppkqc5c25tdjfbktnrm6qwh75yk1y', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-U4NimgVupnhbg7VOoCtm9m3sv0tK213xaZ-6GYi_FoTr9jJn7IuJNyp_E2WZ7GdR6y3RV70MV2U5Hn9XD_Diot9VurC449IhV0WYIIM5JCq-q1QUq-ifkcAJEFokJsGSCrg1iSyymJeX8AHmA4Xw:1rsgw9:6Og77PjMghinBw0u1vkuymSEokHYe_UH_reAz25Ex9Y', '2024-04-05 11:36:45.041828'),
('t5wraipz7q428z3ssog5ud63gik3jfu4', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJrT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD6YDgu:1rs4zh:epgu2GGAwI8h4t3gQx02i_vtVLTpDaurUE66L32CtXE', '2024-04-03 19:05:53.675172'),
('v507pqn4jhyfml7h4l7ye328yn7hx4ac', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rqud5:ot4IctKzud24Q0F6xPBAI1s1Y826rxNA5jVhnH9J4EM', '2024-03-31 13:49:43.157787'),
('vakd71jx7rn6010hr3r601qeaoa70teg', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rt2Mg:IrZMghN89hFldpNOtqh8l-uzVLLIrbIJdhxGC0mJ3U4', '2024-04-06 10:29:34.163025'),
('w44nisms1bvmnk1lydixef224bzmicz3', '.eJxVjEEOgjAQRe_StWlapkzRpXvO0EynM4IaSCisjHdXEha6_e-9_zKJtnVIW5UljcVcDJjT75aJHzLtoNxpus2W52ldxmx3xR602n4u8rwe7t_BQHX41uoaxx6RCrosjQgzkkKn6rVFir4N-dwAIgsEhdAxQFYHoUSXYxTz_gD4lTgr:1rrljC:VhV-Rsr9VH-yekaECTHZQFgPTWoqwtlEJQX6bZnjxtM', '2024-04-02 22:31:34.725060'),
('xgsj98u2dpk9jkomooj1coojloopo6oh', '.eJxVjEsOwjAMBe-SNYqSOHUKS_Y9Q-U4NimgVupnhbg7VOoCtm9m3sv0tK213xaZ-6GYi_HenH7HTPyQcSflTuNtsjyN6zxkuyv2oIvtpiLP6-H-HVRa6rdWFxx7RCrosgQRZiSFVtVrg5R8E_M5ACILRIXYMkBWB7Ekl1MS8_4AG2M4Wg:1rsh68:4YniXX4qQAJFwyBW-tjQOGUQfgG-ZGzOtuNIkHwR7Dk', '2024-04-05 11:47:04.389297');

-- --------------------------------------------------------

--
-- Table structure for table `property_caretaker`
--

CREATE TABLE `property_caretaker` (
  `caretaker_id` varchar(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `description` longtext DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `hire_date` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_contract`
--

CREATE TABLE `property_contract` (
  `contract_id` varchar(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `contract_image` varchar(100) DEFAULT NULL,
  `tenant_name_id` varchar(10) NOT NULL,
  `unit_id_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_contract`
--

INSERT INTO `property_contract` (`contract_id`, `start_date`, `end_date`, `created_at`, `contract_image`, `tenant_name_id`, `unit_id_id`) VALUES
('C1BD', '2024-04-26', '2029-10-15', '2024-04-02 16:57:55.290982', '', 'T1D44', 'UC5A'),
('C1EF', '2021-02-21', '2024-02-29', '2024-03-26 19:56:19.242891', '', 'T0D1D', 'U03D'),
('C2A8', '2024-05-06', '2033-05-24', '2024-03-31 11:17:06.576296', '', 'T2324', 'U5EF'),
('C2DB', '2024-05-06', '2033-05-24', '2024-03-30 23:12:29.103064', 'contract_images/contract_ylAJpLj.png', 'T983C', 'U2AB'),
('C32A', '2024-03-30', '2030-05-21', '2024-03-30 08:19:17.129925', 'contract_images/FULLTEXT01.pdf', 'TBBB3', 'UC48'),
('C398', '2009-11-21', '2025-05-21', '2024-03-26 20:33:32.043118', '', 'T642E', 'UCA2'),
('C405', '2025-02-26', '2032-09-06', '2024-03-26 20:24:44.052108', '', 'T61A2', 'U89B'),
('C426', '2024-10-21', '2023-09-16', '2024-03-26 20:34:08.831479', 'contract_images/weekly_exercises_and_assignments.doc', 'T8F5D', 'U6AF'),
('C499', '2024-05-06', '2033-05-24', '2024-04-01 14:28:57.338473', '', 'T8734', 'U009'),
('C6FB', '2024-08-11', '2024-11-29', '2024-03-26 20:34:44.400564', '', 'T31F0', 'UECF'),
('C852', '2020-05-31', '2029-04-18', '2024-03-26 20:35:14.231543', '', 'TCE06', 'U7EF'),
('CB50', '2017-07-30', '2022-12-17', '2024-03-26 20:32:35.433062', '', 'TD669', 'UFAE'),
('CD2A', '2024-10-09', '2028-08-17', '2024-03-26 20:29:50.938667', '', 'T4F91', 'U085'),
('CD80', '2024-04-05', '2030-02-14', '2024-04-05 10:28:09.886135', 'contract_images/Tenancy-Agreement.pdf', 'T9AC6', 'UE5C'),
('CEFE', '2023-03-30', '2024-05-12', '2024-03-26 20:25:08.836421', '', 'TE18C', 'U748');

-- --------------------------------------------------------

--
-- Table structure for table `property_customuser`
--

CREATE TABLE `property_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_customuser`
--

INSERT INTO `property_customuser` (`id`, `password`, `last_login`, `username`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`) VALUES
(3, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 10:17:47.687585', 'Sarah', 'sarah@gmail.com', 1, 1, '2024-03-28 09:30:33.329116', 'landlord'),
(4, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 07:38:34.288867', 'Hugh', 'hugh@gmail.com', 0, 1, '2024-03-28 10:38:32.973998', 'tenant'),
(5, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-06 08:39:55.104886', 'Hermina', 'Hermina@gmail.com', 0, 1, '2024-03-28 10:39:06.827371', 'tenant'),
(6, 'pbkdf2_sha256$720000$NSqns3f9STxShuhKyvK47k$esNoU88znDxkvTimmweaEn0GLR6i1D6LRx3UQVC6iBE=', '2024-04-12 10:03:49.172440', 'Dylan', 'Dylan@gmail.com', 0, 1, '2024-03-28 10:39:30.805620', 'tenant'),
(7, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 10:49:16.815020', 'Korbin_Hodkiewicz', 'Korbin@gmail.com', 0, 1, '2024-03-28 10:40:05.673086', 'tenant'),
(8, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 13:18:39.920615', 'Patience', 'Patience@gmail.com', 0, 1, '2024-03-28 10:40:29.461820', 'tenant'),
(9, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 07:37:28.054387', 'Rahsaan21', 'Rahsaan@gmail.com', 0, 1, '2024-03-28 10:40:54.328151', 'tenant'),
(10, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-03 11:04:56.225484', 'ClintonC', 'Clinton@gmail.com', 0, 1, '2024-03-28 10:41:38.343748', 'tenant'),
(11, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-06 08:39:47.300202', 'Alexander', 'Alexander@gmail.com', 0, 1, '2024-03-28 10:41:57.488404', 'tenant'),
(12, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 09:55:38.870320', 'Wilderman', 'Wilderman@gmail.com', 0, 1, '2024-03-28 10:42:28.111545', 'tenant'),
(13, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-03 11:05:13.787370', 'Ross', 'Ross@gmail.com', 0, 1, '2024-03-28 10:43:05.716568', 'tenant'),
(14, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 10:00:25.078582', 'Brennon', 'Brennon@gmail.com', 0, 1, '2024-03-28 10:53:33.414001', 'tenant'),
(15, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 10:06:16.566937', 'Nya', 'Nya@gmail.com', 0, 1, '2024-03-28 10:53:52.976850', 'tenant'),
(16, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-06 08:21:47.989279', 'Fred', 'Fred@gmail.com', 0, 1, '2024-03-28 10:54:20.699085', 'tenant'),
(17, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 10:01:58.934743', 'Cristal', 'Cristal@gmail.com', 0, 1, '2024-03-28 10:54:42.713880', 'tenant'),
(18, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-03 09:21:25.008336', 'Jessica', 'Jessica38@gmail.com', 0, 1, '2024-03-28 10:54:58.342487', 'tenant'),
(19, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 06:33:42.144701', 'Isadore', 'Isadore@gmail.com', 0, 1, '2024-03-28 10:55:18.811626', 'tenant'),
(20, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 07:08:31.148558', 'Lance', 'Lance@gmail.com', 0, 1, '2024-03-28 10:55:36.652564', 'tenant'),
(21, 'pbkdf2_sha256$720000$5wDjH1MehsEUPFhaEmw9v4$MATj/bHp0PyabEtxW3GJkmQ3Z4PH6Wn3SF/1VQ/u7zY=', '2024-03-28 16:01:41.187348', 'Catherine', 'Catherine@gmail.com', 0, 1, '2024-03-28 10:55:57.895277', 'tenant'),
(22, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-05 08:07:44.227429', 'Shania', 'Shania@gmail.com', 0, 1, '2024-03-28 10:56:28.118018', 'tenant'),
(23, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-06 08:21:22.992119', 'Keshawn', 'Keshawn.Ortiz@gmail.com', 0, 1, '2024-03-28 10:56:47.793043', 'tenant'),
(24, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-06 08:40:07.648644', 'Makenzie84', 'Makenzie841@gmail.com', 0, 1, '2024-03-28 10:57:05.573779', 'tenant'),
(25, 'pbkdf2_sha256$720000$1F6JPdHB3TaKxp8WJdxUK5$4W4vsFV9U6FS/uS2xjX5Gmun/GV3inArg7T4VebSHT4=', '2024-04-12 09:52:46.551717', 'jeremiah', 'jekanjoroge0809@gmail.com', 0, 1, '2024-03-30 08:15:17.330342', 'tenant'),
(26, 'pbkdf2_sha256$720000$mxrtFegLfZvWjIKMcefCgp$s3rmSXE2h0XwT9qYlZHolK5qKHllRlFXgTfsZXz4e1A=', '2024-04-02 16:20:04.452582', 'julia_njoroge', 'njorogejulia87@gmail.com', 0, 1, '2024-04-01 14:26:14.228790', 'tenant'),
(28, 'pbkdf2_sha256$720000$yeNAlaX0TGZxp4heepE9J7$sT2mzDZnj6nfBYwD3HWTeEbr1D2qRPgYQq0TQTcSGnA=', '2024-04-12 09:55:49.779065', 'ann_njeri', 'anna@gmail.com', 0, 1, '2024-04-02 16:38:02.991569', 'tenant'),
(29, 'pbkdf2_sha256$720000$aXDwAFIcvbv1kQUBSkOMjX$DuHmhsQjW/mjjfpoJPvqq3+j6r9QtKp0A7tc1zH32ck=', '2024-04-05 10:47:21.663992', 'simon_war', 'sanchez@gmail.com', 0, 1, '2024-04-02 16:51:26.295874', 'tenant'),
(30, 'pbkdf2_sha256$720000$69hZTbZmS0Cmxk2xI8hTi0$qm+vvi7+peQgmfkMvIiYsKc4jrKeJ2aQLzuAGFydtFg=', '2024-04-03 07:03:03.835030', 'joseph', 'josephnj@gmail.com', 0, 1, '2024-04-03 07:02:45.988237', 'tenant');

-- --------------------------------------------------------

--
-- Table structure for table `property_payment`
--

CREATE TABLE `property_payment` (
  `payment_id` varchar(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_reference_no` varchar(20) DEFAULT NULL,
  `contract_id_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_payment`
--

INSERT INTO `property_payment` (`payment_id`, `amount`, `date`, `payment_method`, `created_at`, `payment_reference_no`, `contract_id_id`) VALUES
('P2DBF701D', 25100.00, '2023-07-07', 'mpesa', '2024-03-26 20:43:16.225403', 'SSS12JWI0J', 'C398'),
('P3D730090', 500.00, '2024-04-06', 'mpesa', '2024-04-06 08:39:07.882900', 'HJIW98NSD0', 'C2A8'),
('P4EDEC507', 10000.00, '2024-07-06', 'mpesa', '2024-03-26 20:52:43.194200', 'IOS2121YU4', 'CB50'),
('P6F8F3E83', 5000.00, '2024-03-28', 'mpesa', '2024-03-28 12:24:28.138411', 'ANGEL1234', 'CD2A'),
('P9D649EF1', 17882.00, '2025-02-23', 'cash', '2024-03-26 20:38:05.677866', NULL, 'C1EF'),
('PA55C4E94', 4000.00, '2023-05-29', 'bank', '2024-03-26 20:43:43.098808', 'Equity Paybill', 'C6FB'),
('PA97630FC', 82133.00, '2024-03-31', 'bank', '2024-03-30 23:15:21.117725', 'ABSA Bank', 'C2DB'),
('PAA9423AD', 9000.00, '2024-01-04', 'mpesa', '2024-04-01 14:32:02.483473', 'uxghdhuw', 'C499'),
('PAD544AA6', 530.00, '2024-04-05', 'mpesa', '2024-04-05 07:26:58.506810', 'ADFGTTHU009', 'C426'),
('PB506926E', 670.00, '2024-04-03', 'mpesa', '2024-04-02 19:01:43.855259', 'RTY6GGHG78', 'C1EF'),
('PBDB6F099', 15000.00, '2024-04-04', 'mpesa', '2024-03-31 11:55:22.016712', 'QQWUQI919', 'CD2A'),
('PC8A19438', 3000.00, '2024-04-02', 'mpesa', '2024-04-02 19:00:57.559856', 'ASDSRE6YHHJ', 'C1EF'),
('PD1312D98', 4000.00, '2023-05-09', 'bank', '2024-03-26 20:51:23.725422', 'KCB', 'C405'),
('PEA27AAE7', 5657.00, '2023-09-26', 'cash', '2024-03-26 20:52:00.624787', NULL, 'C426'),
('PEB66984B', 4000.00, '2023-09-26', 'mpesa', '2024-03-26 20:39:43.856767', 'ABC1234XYZ', 'CEFE');

-- --------------------------------------------------------

--
-- Table structure for table `property_property`
--

CREATE TABLE `property_property` (
  `property_id` varchar(10) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `property_images` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_property`
--

INSERT INTO `property_property` (`property_id`, `property_name`, `location`, `property_images`, `description`, `active`, `created_at`) VALUES
('P1', 'Three Rey Student Hostels', 'Kabuku, Limuru', '', 'Affordable Student Hostels Secure', 1, '2024-03-21 08:24:18.801028'),
('P2', 'Limuru Flex Apartments', 'Karanjee, Limuru', 'property_images/pexels-alex-qian-2343465.jpg', 'Five Star Spacious Living', 1, '2024-03-30 08:29:02.602288');

-- --------------------------------------------------------

--
-- Table structure for table `property_tenant`
--

CREATE TABLE `property_tenant` (
  `tenant_id` varchar(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `description` longtext DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `intake_date` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_tenant`
--

INSERT INTO `property_tenant` (`tenant_id`, `first_name`, `last_name`, `email`, `phone`, `description`, `username`, `intake_date`, `last_login`, `profile_pic`, `active`) VALUES
('T0D1D', 'Hugh', 'Wilderman', 'hugh@gmail.com', '333-629-4290', 'Incidunt provident exercitationem quo cupiditate expedita esse iusto asperiores.', 'Hugh', '2024-03-26 19:50:19.990884', NULL, 'tenant_profile_pics/eb13e9e59b1cd754451259170d55d379.jpg', 1),
('T1D44', 'Ann', 'Njeri', 'anna@gmail.com', '+254723928382', 'Teacher', 'ann_njeri', '2024-04-02 16:38:03.106144', NULL, 'tenant_profile_pics/wahu.jpeg', 1),
('T2068', 'Hermina', 'Stamm', 'Hermina@gmail.com', '047-515-5619', 'Pariatur et suscipit nulla exercitationem vitae.', 'Hermina', '2024-03-26 19:41:37.970144', NULL, 'tenant_profile_pics/hermina_7tQ8tY4.jpeg', 1),
('T2324', 'Dylan', 'Orn', 'Dylan@gmail.com', '714-033-1281', 'Maiores at nemo beatae sapiente provident.', 'Dylan', '2024-03-26 19:49:16.036375', NULL, 'tenant_profile_pics/kris.jpeg', 1),
('T2CB7', 'Korbin', 'Hodkiewicz', 'Korbin@gmail.com', '213-043-0775', 'Placeat doloremque illum vitae dolores quod.', 'Korbin_Hodkiewicz', '2024-03-26 19:48:06.987083', NULL, 'tenant_profile_pics/saul.jpeg', 1),
('T31F0', 'Patience', 'Koss', 'Patience@gmail.com', '753-439-8436', 'Magni ut praesentium nobis.', 'Patience', '2024-03-26 19:52:20.510346', NULL, 'tenant_profile_pics/diy.jpeg', 1),
('T4C84', 'Simon', 'Warui', 'sanchez@gmail.com', '+25471890090', 'Accountant', 'simon_war', '2024-04-02 16:51:26.451752', NULL, 'tenant_profile_pics/red.jpeg', 1),
('T4F91', 'Rahsaan', 'Stoltenberg', 'Rahsaan@gmail.com', '703-719-4975', 'Ea soluta ab tempore architecto ipsam.', 'Rahsaan21', '2024-03-26 19:51:02.774082', NULL, '', 1),
('T5A3A', 'Clinton', 'Conroy', 'Clinton@gmail.com', '531-364-2947', 'Inventore laboriosam itaque nemo nesciunt voluptates labore voluptatem.', 'ClintonC', '2024-03-26 19:42:30.272181', NULL, '', 1),
('T5C31', 'Alexander', 'Schroeder', 'Alexander@gmail.com', '381-774-8157', 'Saepe quidem error ex.', 'Alexander', '2024-03-26 19:42:06.586438', NULL, '', 1),
('T61A2', 'Hugh', 'Wilderman', 'Wilderman@gmail.com', '333-629-4290', 'Incidunt provident exercitationem quo cupiditate expedita esse iusto asperiores.', 'Wilderman', '2024-03-26 19:49:42.074380', NULL, '', 1),
('T642E', 'Ross', 'Gerhold-Sawayn', 'Ross@gmail.com', '560-953-2553', 'Cum ut quam dolorem ut deserunt.', 'Ross', '2024-03-26 19:52:05.460705', NULL, '', 1),
('T8734', 'Julia', 'Njoroge', 'njorogejulia87@gmail.com', '+254702126893', '', 'julia_njoroge', '2024-04-01 14:26:14.423471', NULL, '', 1),
('T8F5D', 'Brennon', 'Gerlach', 'Brennon@gmail.com', '813-257-9609', 'Praesentium sed perspiciatis.', 'Brennon', '2024-03-26 19:43:05.569778', NULL, 'tenant_profile_pics/467d3803614f240b1300b00689ce43e7.jpg', 1),
('T983C', 'Nya', 'Fahey', 'Nya@gmail.com', '555-663-9280', 'Placeat aliquam consequatur iste placeat aliquid tempore.', 'Nya', '2024-03-26 19:51:16.453260', NULL, '', 1),
('T9AC6', 'Fred', 'Smitham', 'Fred@gmail.com', '793-952-1328', 'Enim minima perspiciatis.', 'Fred', '2024-03-26 19:50:38.317429', NULL, 'tenant_profile_pics/fred.jpeg', 1),
('TAD5F', 'Cristal', 'O\'Hara', 'Cristal@gmail.com', '909-655-4430', 'Vel velit tempore nesciunt qui.', 'Cristal', '2024-03-26 19:51:53.488202', NULL, '', 1),
('TB13F', 'Jessica', 'Rath', 'Jessica38@gmail.com', '717-733-1222', 'Quos odit doloremque corporis odit accusantium expedita harum magnam.', 'Jessica', '2024-03-26 19:49:31.124644', NULL, '', 1),
('TB4A1', 'Isadore', 'Marquardt', 'Isadore@gmail.com', '434-844-0644', 'Voluptatibus magnam unde et beatae.', 'Isadore', '2024-03-26 19:48:49.640095', NULL, '', 1),
('TB771', 'Lance', 'Turner', 'Lance@gmail.com', '798-008-5926', 'Id temporibus natus quidem in maiores.', 'Lance', '2024-03-26 19:42:48.894012', NULL, '', 1),
('TBBB3', 'Jeremiah', 'Njoroge', 'jekanjoroge0809@gmail.com', '+254712290899', 'Software Engineer', 'jeremiah', '2024-03-30 08:15:17.684457', NULL, 'tenant_profile_pics/killin_dem.jpg', 1),
('TCE06', 'Catherine', 'Rosenbaum', 'Catherine@gmail.com', '467-685-5364', 'Quibusdam libero sit quibusdam ullam debitis dicta sunt quisquam.', 'Catherine', '2024-03-26 19:48:31.757183', NULL, '', 1),
('TD669', 'Shania', 'Pouros', 'Shania@gmail.com', '642-412-7182', 'Maiores aspernatur ut perspiciatis maxime quaerat sed sit cumque.', 'Shania', '2024-03-26 19:51:30.657989', NULL, '', 1),
('TE18C', 'Keshawn', 'Ortiz', 'Keshawn.Ortiz@gmail.com', '614-783-5731', 'Aliquam vero optio consequatur.', 'Keshawn', '2024-03-26 19:49:02.182172', NULL, '', 1),
('TE7D7', 'Makenzie', 'Kamau', 'Makenzie841@gmail.com', '213-043-0775', 'Placeat doloremque illum vitae dolores quod.', 'Makenzie84', '2024-03-26 19:43:42.295605', NULL, '', 1),
('TEFDD', 'Joseph', 'Njoroge', 'josephnj@gmail.com', '+254712345678', 'Electrical Engineer', 'joseph', '2024-04-03 07:02:46.138086', NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_unit`
--

CREATE TABLE `property_unit` (
  `unit_id` varchar(10) NOT NULL,
  `description` longtext DEFAULT NULL,
  `unit_type` varchar(20) NOT NULL,
  `rent_amount` decimal(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `property_name_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_unit`
--

INSERT INTO `property_unit` (`unit_id`, `description`, `unit_type`, `rent_amount`, `active`, `created_at`, `property_name_id`) VALUES
('U009', 'single room', 'single', 3500.00, 0, '2024-03-26 19:30:53.958707', 'P1'),
('U03D', 'two bedroom', 'two_bedroom', 25000.00, 0, '2024-03-26 19:34:17.428100', 'P1'),
('U085', 'two bedroom', 'two_bedroom', 25000.00, 0, '2024-03-26 19:34:28.293005', 'P1'),
('U2AB', 'Unit 1 Flex', 'two_bedroom', 45000.00, 0, '2024-03-30 08:32:14.086921', 'P2'),
('U3F8', 'unit 1', 'bedsitter', 4000.00, 1, '2024-03-23 08:44:00.433391', 'P1'),
('U58C', 'two bedroom', 'two_bedroom', 25000.00, 1, '2024-03-26 19:33:57.372476', 'P1'),
('U5EF', 'single room', 'single', 3500.00, 0, '2024-03-26 19:31:06.494959', 'P1'),
('U6AF', 'bedsitter', 'bedsitter', 4000.00, 0, '2024-03-26 19:29:59.141829', 'P1'),
('U748', 'bedsitter', 'bedsitter', 4000.00, 0, '2024-03-26 19:30:12.093470', 'P1'),
('U7B7', 'single room', 'single', 3500.00, 1, '2024-03-26 19:31:37.596405', 'P1'),
('U7EF', 'one bedroom', 'one_bedroom', 10000.00, 0, '2024-03-26 19:32:16.185998', 'P1'),
('U89B', 'Bedsitter', 'bedsitter', 4000.00, 0, '2024-03-26 19:29:36.415706', 'P1'),
('UC48', 'two bedroom', 'two_bedroom', 25000.00, 0, '2024-03-26 19:34:42.652267', 'P1'),
('UC5A', 'single room', 'single', 3500.00, 0, '2024-03-26 19:31:25.134531', 'P1'),
('UCA2', 'hjh', 'two_bedroom', 25000.00, 0, '2024-03-23 09:55:46.507053', 'P1'),
('UD11', 'one bedroom', 'one_bedroom', 10000.00, 1, '2024-03-26 19:33:30.281928', 'P1'),
('UD7A', 'test 2', 'single', 3500.00, 1, '2024-03-23 10:11:26.401422', 'P1'),
('UE5C', 'one bedroom', 'one_bedroom', 10000.00, 0, '2024-03-26 19:32:46.646904', 'P1'),
('UE75', 'one bedroom', 'one_bedroom', 10000.00, 1, '2024-03-26 19:33:12.685275', 'P1'),
('UECF', 'bedsitter', 'bedsitter', 4000.00, 0, '2024-03-26 19:30:28.170836', 'P1'),
('UFAE', 'one bedroom', 'one_bedroom', 10000.00, 0, '2024-03-26 19:33:01.612475', 'P1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_property_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `property_caretaker`
--
ALTER TABLE `property_caretaker`
  ADD PRIMARY KEY (`caretaker_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `property_contract`
--
ALTER TABLE `property_contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `property_contract_tenant_name_id_836e088e_fk_property_` (`tenant_name_id`),
  ADD KEY `property_contract_unit_id_id_e7b3c306_fk_property_unit_unit_id` (`unit_id_id`);

--
-- Indexes for table `property_customuser`
--
ALTER TABLE `property_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `property_customuser_email_71a05393_uniq` (`email`);

--
-- Indexes for table `property_payment`
--
ALTER TABLE `property_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_reference_no` (`payment_reference_no`),
  ADD KEY `property_payment_contract_id_id_72b5b5bb_fk_property_` (`contract_id_id`);

--
-- Indexes for table `property_property`
--
ALTER TABLE `property_property`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `property_tenant`
--
ALTER TABLE `property_tenant`
  ADD PRIMARY KEY (`tenant_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `property_unit`
--
ALTER TABLE `property_unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `property_unit_property_name_id_38d88e70_fk_property_` (`property_name_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `property_customuser`
--
ALTER TABLE `property_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_property_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `property_customuser` (`id`);

--
-- Constraints for table `property_contract`
--
ALTER TABLE `property_contract`
  ADD CONSTRAINT `property_contract_tenant_name_id_836e088e_fk_property_` FOREIGN KEY (`tenant_name_id`) REFERENCES `property_tenant` (`tenant_id`),
  ADD CONSTRAINT `property_contract_unit_id_id_e7b3c306_fk_property_unit_unit_id` FOREIGN KEY (`unit_id_id`) REFERENCES `property_unit` (`unit_id`);

--
-- Constraints for table `property_payment`
--
ALTER TABLE `property_payment`
  ADD CONSTRAINT `property_payment_contract_id_id_72b5b5bb_fk_property_` FOREIGN KEY (`contract_id_id`) REFERENCES `property_contract` (`contract_id`);

--
-- Constraints for table `property_unit`
--
ALTER TABLE `property_unit`
  ADD CONSTRAINT `property_unit_property_name_id_38d88e70_fk_property_` FOREIGN KEY (`property_name_id`) REFERENCES `property_property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
