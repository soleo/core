<?php
/**
 * Routes.
 *
 * @copyright Zikula contributors (Zikula)
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License
 * @author Zikula contributors <support@zikula.org>.
 * @link http://www.zikula.org
 * @link http://zikula.org
 * @version Generated by ModuleStudio 0.6.2 (http://modulestudio.de).
 */

namespace Zikula\RoutesModule\Util;

use Zikula\RoutesModule\Util\Base\ControllerUtil as BaseControllerUtil;
use Zikula_Request_Http;

/**
 * Utility implementation class for controller helper methods.
 */
class ControllerUtil extends BaseControllerUtil
{

	// Bugfix, @Most#592
    public function retrieveIdentifier(Zikula_Request_Http $request, array $args, $objectType = '', array $idFields)
    {
        $idValues = array();
        foreach ($idFields as $idField) {
            $defaultValue = isset($args[$idField]) && is_numeric($args[$idField]) ? $args[$idField] : 0;
            if ($this->hasCompositeKeys($objectType)) {
                // composite key may be alphanumeric
                $id = $request->attributes->get("_route_params[$idField]", $defaultValue, true);
            } else {
                // single identifier
                $id = (int) filter_var($request->attributes->get("_route_params[$idField]", $defaultValue, true), FILTER_VALIDATE_INT);
            }
            // fallback if id has not been found yet
            if (!$id && $idField != 'id' && count($idFields) == 1) {
                $defaultValue = isset($args['id']) && is_numeric($args['id']) ? $args['id'] : 0;
                $id = (int) filter_var($request->attributes->get("_route_params[$idField]", $defaultValue, true), FILTER_VALIDATE_INT);
            }
            $idValues[$idField] = $id;
        }

        return $idValues;
    }
}
