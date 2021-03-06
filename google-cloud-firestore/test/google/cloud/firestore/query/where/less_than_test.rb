# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "helper"

describe Google::Cloud::Firestore::Query, :where, :less_than, :mock_firestore do
  let(:query) { Google::Cloud::Firestore::Query.start nil, "#{firestore.path}/documents", firestore }

  it "using <" do
    expected_query = Google::Firestore::V1::StructuredQuery.new(
      where: Google::Firestore::V1::StructuredQuery::Filter.new(
        field_filter: Google::Firestore::V1::StructuredQuery::FieldFilter.new(
          field: Google::Firestore::V1::StructuredQuery::FieldReference.new(field_path: "foo"),
          op: :LESS_THAN,
          value: Google::Firestore::V1::Value.new(integer_value: 42)
        )
      )
    )

    generated_query = query.where(:foo, :<, 42).query
    generated_query.must_equal expected_query
  end

  it "using lt" do
    expected_query = Google::Firestore::V1::StructuredQuery.new(
      where: Google::Firestore::V1::StructuredQuery::Filter.new(
        field_filter: Google::Firestore::V1::StructuredQuery::FieldFilter.new(
          field: Google::Firestore::V1::StructuredQuery::FieldReference.new(field_path: "foo"),
          op: :LESS_THAN,
          value: Google::Firestore::V1::Value.new(integer_value: 42)
        )
      )
    )

    generated_query = query.where(:foo, :lt, 42).query
    generated_query.must_equal expected_query
  end

  it "using <=" do
    expected_query = Google::Firestore::V1::StructuredQuery.new(
      where: Google::Firestore::V1::StructuredQuery::Filter.new(
        field_filter: Google::Firestore::V1::StructuredQuery::FieldFilter.new(
          field: Google::Firestore::V1::StructuredQuery::FieldReference.new(field_path: "foo"),
          op: :LESS_THAN_OR_EQUAL,
          value: Google::Firestore::V1::Value.new(integer_value: 42)
        )
      )
    )

    generated_query = query.where(:foo, :<=, 42).query
    generated_query.must_equal expected_query
  end

  it "using lte" do
    expected_query = Google::Firestore::V1::StructuredQuery.new(
      where: Google::Firestore::V1::StructuredQuery::Filter.new(
        field_filter: Google::Firestore::V1::StructuredQuery::FieldFilter.new(
          field: Google::Firestore::V1::StructuredQuery::FieldReference.new(field_path: "foo"),
          op: :LESS_THAN_OR_EQUAL,
          value: Google::Firestore::V1::Value.new(integer_value: 42)
        )
      )
    )

    generated_query = query.where(:foo, :lte, 42).query
    generated_query.must_equal expected_query
  end
end
