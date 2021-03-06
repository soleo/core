<?php

namespace Zikula\Core;

/**
 * This class collects names of custom events used for changing module states.
 *
 * @see Zikula\Core\Event\ModuleStateEvent
 */
final class CoreEvents
{
    /** Occurs when a module has been installed. */
    const MODULE_INSTALL = 'module.install';

    /** Occurs when a module has been upgraded to a newer version. */
    const MODULE_UPGRADE = 'module.upgrade';

    /** Occurs when a module has been enabled after it has been disabled before. */
    const MODULE_ENABLE = 'module.enable';

    /** Occurs when a module has been disabled. */
    const MODULE_DISABLE = 'module.disable';

    /** Occurs when a module has been removed entirely. */
    const MODULE_REMOVE = 'module.remove';
}
