# SPDX-FileCopyrightText: 2022 Greg Davill
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

lv = pya.LayoutView.current()
ly = pya.CellView.active().layout()

# top cell bounding box in micrometer units
bbox = ly.top_cell().dbbox()

# compute an image size having the same aspect ratio than 
# the bounding box
w = 1200
h = int(0.5 + w * bbox.height() / bbox.width())

lv.save_image_with_options('layout.png', w, h, 0, 0, 0, bbox, False)
