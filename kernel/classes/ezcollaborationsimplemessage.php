<?php
//
// Definition of eZCollaborationSimpleMessage class
//
// Created on: <24-Jan-2003 15:38:57 amos>
//
// Copyright (C) 1999-2003 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE.GPL included in
// the packaging of this file.
//
// Licencees holding valid "eZ publish professional licences" may use this
// file in accordance with the "eZ publish professional licence" Agreement
// provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" is available at
// http://ez.no/home/licences/professional/. For pricing of this licence
// please contact us via e-mail to licence@ez.no. Further contact
// information is available at http://ez.no/home/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

/*! \file ezcollaborationsimplemessage.php
*/

/*!
  \class eZCollaborationSimpleMessage ezcollaborationsimplemessage.php
  \brief The class eZCollaborationSimpleMessage does

*/

include_once( 'kernel/classes/ezpersistentobject.php' );

class eZCollaborationSimpleMessage extends eZPersistentObject
{
    /*!
     Constructor
    */
    function eZCollaborationSimpleMessage( $row )
    {
        $this->eZPersistentObject( $row );
    }

    function &definition()
    {
        return array( 'fields' => array( 'id' => 'ID',
                                         'message_type' => 'MessageType',
                                         'data_text1' => 'DataText1',
                                         'data_text2' => 'DataText2',
                                         'data_text3' => 'DataText3',
                                         'data_int1' => 'DataInt1',
                                         'data_int2' => 'DataInt2',
                                         'data_int3' => 'DataInt3',
                                         'data_float1' => 'DataFloat1',
                                         'data_float2' => 'DataFloat2',
                                         'data_float3' => 'DataFloat3',
                                         'creator_id' => 'CreatorID',
                                         'created' => 'Created',
                                         'modified' => 'Modified' ),
                      'keys' => array( 'id' ),
                      'increment_key' => 'id',
                      'class_name' => 'eZCollaborationSimpleMessage',
                      'name' => 'ezcollab_simple_message' );
    }

    function &create( $type, $text = false, $creatorID = false )
    {
        include_once( 'lib/ezlocale/classes/ezdatetime.php' );
        $date_time = eZDateTime::currentTimeStamp();
        if ( $creatorID === false )
        {
            include_once( 'kernel/classes/datatypes/ezuser/ezuser.php' );
            $user =& eZUser::currentUser();
            $creatorID =& $user->attribute( 'contentobject_id' );
        }
        $row = array(
            'message_type' => $type,
            'data_text1' => $text,
            'creator_id' => $creatorID,
            'created' => $date_time,
            'modified' => $date_time );
        return new eZCollaborationSimpleMessage( $row );
    }

    function &fetch( $id, $asObject = true )
    {
        return eZPersistentObject::fetchObject( eZCollaborationSimpleMessage::definition(),
                                                null,
                                                array( "id" => $id ),
                                                $asObject );
    }

    function hasAttribute( $attr )
    {
        return ( $attr == 'participant' or
                 eZPersistentObject::hasAttribute( $attr ) );
    }

    function &attribute( $attr )
    {
        switch( $attr )
        {
            case 'participant':
            {
                // TODO: Get participant trough participant link from item
            } break;
            default:
                return eZPersistentObject::attribute( $attr );
        }
    }

    /// \privatesection
    var $ID;
    var $ParticipantID;
    var $Created;
    var $Modified;
    var $DataText1;
    var $DataText2;
    var $DataText3;
    var $DataInt1;
    var $DataInt2;
    var $DataInt3;
    var $DataFloat1;
    var $DataFloat2;
    var $DataFloat3;
}

?>
