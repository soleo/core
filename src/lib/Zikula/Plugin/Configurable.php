<?php
/**
 * Copyright Zikula Foundation 2009 - Zikula Application Framework
 *
 * This work is contributed to the Zikula Foundation under one or more
 * Contributor Agreements and licensed to You under the following license:
 *
 * @license GNU/LGPLv3 (or at your option, any later version).
 * @package Zikula
 *
 * Please see the NOTICE file distributed with this source code for further
 * information regarding copyright and licensing.
 */

interface Zikula_Plugin_Configurable
{
    /**
     * Return an instance of the configuration controller.
     *
     * Example:
     * <samp>
     *     return new SystemPlugin_Example_Controller($this->serviceManager, array('plugin' => $this));
     * </samp>
     *
     * @return Zikula_Controller_Plugin
     */
    public function getConfigurationController();
}
