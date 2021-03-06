# This file is part of Indico.
# Copyright (C) 2002 - 2018 European Organization for Nuclear Research (CERN).
#
# Indico is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3 of the
# License, or (at your option) any later version.
#
# Indico is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Indico; if not, see <http://www.gnu.org/licenses/>.

from __future__ import unicode_literals

from flask import jsonify, session
from sqlalchemy.orm import joinedload
from werkzeug.exceptions import Forbidden

from indico.modules.rb.controllers import RHRoomBookingBase
from indico.modules.rb.models.locations import Location
from indico.modules.rb.models.rooms import Room
from indico.modules.rb.util import rb_is_admin
from indico.modules.rb_new.schemas import admin_locations_schema


class RHRoomBookingAdminBase(RHRoomBookingBase):
    def _check_access(self):
        RHRoomBookingBase._check_access(self)
        if not rb_is_admin(session.user):
            raise Forbidden


class RHLocations(RHRoomBookingAdminBase):
    def _process(self):
        query = Location.query.options(joinedload('rooms'))
        return jsonify(admin_locations_schema.dump(query.all()).data)
