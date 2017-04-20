<?php

/**
 * @file plugins/themes/default/WesternsemThemePlugin.inc.php
 *
 * Copyright (c) 2016 Western Theological Seminary Library
 * Copyright (c) 2016 Stephen E. Michaels
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class WesternsemThemePlugin
 * @ingroup plugins_themes_westernsem
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');
class WesternsemThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {

		// Register option for bootstrap themes
		$this->addOption('bootstrapTheme', 'radio', array(
			'label' => 'plugins.themes.westernsem.options.bootstrapTheme.label',
			'description' => 'plugins.themes.westernsem.options.bootstrapTheme.description',
			'options' => array(
				'bootstrap' =>  'plugins.themes.westernsem.options.bootstrapTheme.bootstrap',
				'cerulean'   => 'plugins.themes.westernsem.options.bootstrapTheme.cerulean',
				'cleanblog'  => 'plugins.themes.westernsem.options.bootstrapTheme.cleanblog',
				'cosmo'      => 'plugins.themes.westernsem.options.bootstrapTheme.cosmo',
				'cyborg'     => 'plugins.themes.westernsem.options.bootstrapTheme.cyborg',
				'darkly'     => 'plugins.themes.westernsem.options.bootstrapTheme.darkly',
				'flatly'     => 'plugins.themes.westernsem.options.bootstrapTheme.flatly',
				'journal'    => 'plugins.themes.westernsem.options.bootstrapTheme.journal',
				'lumen'      => 'plugins.themes.westernsem.options.bootstrapTheme.lumen',
				'paper'      => 'plugins.themes.westernsem.options.bootstrapTheme.paper',
				'readable'   => 'plugins.themes.westernsem.options.bootstrapTheme.readable',
				'sandstone'  => 'plugins.themes.westernsem.options.bootstrapTheme.sandstone',
				'simplex'    => 'plugins.themes.westernsem.options.bootstrapTheme.simplex',
				'slate'      => 'plugins.themes.westernsem.options.bootstrapTheme.slate',
				'spacelab'   => 'plugins.themes.westernsem.options.bootstrapTheme.spacelab',
				'superhero'  => 'plugins.themes.westernsem.options.bootstrapTheme.superhero',
				'united'     => 'plugins.themes.westernsem.options.bootstrapTheme.united',
				'yeti'       => 'plugins.themes.westernsem.options.bootstrapTheme.yeti',
			)
		));

		$this->addStyle('bootstrap', 'styles/bootstrap.less');

		$locale = AppLocale::getLocale();
		if (AppLocale::getLocaleDirection($locale) === 'rtl') {
			$this->addStyle('bootstrap-rtl', 'bootstrap-rtl/dist/css/bootstrap-rtl.min.css');
		}

		$bootstrapTheme = $this->getOption('bootstrapTheme');
		if (!empty($bootstrapTheme)) {
			$this->addStyle('bootstrapTheme-' . $bootstrapTheme, 'styles/' . $bootstrapTheme . '.less');
		}

		// Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
		$min = Config::getVar('general', 'enable_minified') ? '.min' : '';
		$request = Application::getRequest();
		if (Config::getVar('general', 'enable_cdn')) {
			$jquery = '//cdn.jsdelivr.net/jquery/' . CDN_JQUERY_VERSION . '/jquery' . $min . '.js';
			$jqueryUI = '//cdn.jsdelivr.net/jquery.ui/' . CDN_JQUERY_UI_VERSION . '/jquery-ui' . $min . '.js';
		} else {
			// Use OJS's built-in jQuery files
			$jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
			$jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
		}
		// Use an empty `baseUrl` argument to prevent the theme from looking for
		// the files within the theme directory
		$this->addScript('jQuery', $jquery, array('baseUrl' => ''));
		$this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));
		$this->addScript('jQueryTagIt', $request->getBaseUrl() . '/lib/pkp/js/lib/jquery/plugins/jquery.tag-it.js', array('baseUrl' => ''));

		// Load Boostrap
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.westernsem.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.westernsem.description');
	}
}
