<template>
  <BaseModalForm ref="BaseForm_ref">
    <div class="h-dialog-content">
      <div class="h-dialog-header">
        <div class="h-dialog-header-title">Thông tin nhân viên</div>
        <div class="h-dialog-header-close">
          <button id="btnCancel" v-on:click="hide()"></button>
        </div>
      </div>
      <div class="h-dialog-content-body">
        <ModalValidata
          ref="ModalValidata_ref"
          :validate="validateBag"
          color="red"
        />
        <div class="form-group h-container-center">
          <p class="label-text text-one-line">
            Mã cửa hàng<span class="h-color-validate">&nbsp;*</span>
          </p>
          <input
            class="form-control w-lg"
            placeholder="Bắt buộc..."
            v-bind:class="{ 'is-valid-fail': !validate.shopCode }"
            tabindex="1"
            v-model="shop.shopCode"
            @click="val_ShopCode()"
          />
        </div>

        <div class="form-group h-container-center">
          <p class="label-text text-one-line">
            Tên cửa hàng<span class="h-color-validate">&nbsp;*</span>
          </p>
          <input
            class="form-control w-lg"
            placeholder="Bắt buộc..."
            v-bind:class="{ 'is-valid-fail': !validate.shopName }"
            tabindex="2"
            v-model="shop.shopName"
            @click="val_ShopName()"
          />
        </div>
        <div class="form-group h-container-row">
          <p class="label-text text-one-line">
            Địa chỉ<span class="h-color-validate">&nbsp;*</span>
          </p>
          <textarea
            class="form-control w-lg"
            rows="4"
            placeholder="Bắt buộc..."
            v-bind:class="{ 'is-valid-fail': !validate.address }"
            tabindex="3"
            v-model="shop.address"
            @click="val_Address()"
          />
        </div>
        <div class="h-container">
          <div class="col-6">
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Số điện thoại</p>
              <input
                class="form-control w-sm"
                tabindex="4"
                v-model="shop.phone"
              />
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Quốc gia</p>
              <Combobox
                v-bind:select="selectedCountry"
                v-bind:data="optionCountry"
                @input="selectedCountry = $event"
                class="form-control w-sm"
                tabindex="5"
              />
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Tỉnh/Thành phố</p>
              <Combobox
                v-bind:select="selectedCity"
                v-bind:data="optionCity"
                @input="selectedCity = $event"
                class="form-control w-sm"
                tabindex="6"
              />              
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Phường/Xã</p>
                <Combobox
                v-bind:select="shop.wardId"
                v-bind:data="optionWard"
                @input="wardId = $event"
                class="form-control w-sm"
                tabindex="8"
              />
            </div>
          </div>
          <div class="col-6 h-container-column p-column">
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Mã số thuế</p>
              <input
                class="form-control w-sm"
                tabindex="9"
                v-model="shop.taxCode"
              />
            </div>
            <div class="h-container-column h-container-end h-100">
              <div class="form-group h-container-center">
                <p class="label-text text-one-line">Quận/Huyện</p>
                 <Combobox
                v-bind:select="selectedDistrict"
                v-bind:data="optionDistrict"
                @input="selectedDistrict = $event"
                class="form-control w-sm"
                tabindex="7"
              /></div>
              <div class="form-group h-container-center">
                <p class="label-text text-one-line">Đường phố</p>
                <input
                  class="form-control w-sm"
                  tabindex="10"
                  v-model="shop.street"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="h-dialog-footer h-container-row">
        <button class="h-btn h-btn-3" tabindex="14">
          <i class="h-icon h-icon-suppost"></i>
          <p>Trợ giúp</p>
        </button>
        <div class="ml-auto h-container-row">
          <button
            class="h-btn h-btn-1 mr-lg"
            id="btnSave"
            tabindex="11"
            v-on:click="Confirm(false)"
          >
            <i class="h-icon h-icon-save" aria-hidden="true"></i>
            <p>Lưu</p>
          </button>
          <button
            class="h-btn h-btn-2 mr-lg"
            id="btnSave"
            tabindex="12"
            v-on:click="Confirm(true)"
          >
            <i class="h-icon h-icon-saveAndAdd" aria-hidden="true"></i>
            <p>Lưu và thêm mới</p>
          </button>
          <button class="h-btn h-btn-3" id="btnCancel" @click="hide()">
            <i
              class="h-icon h-icon-cancel-active"
              aria-hidden="true"
              tabindex="13"
            ></i>
            <p>Hủy</p>
          </button>
        </div>
      </div>
    </div>
  </BaseModalForm>
</template>

<script>
import * as axios from "axios";
import config from '@/config'
import * as vldShop from "./ValidateShop.js";
import BaseModalForm from "../BaseModalForm.vue";
import ModalValidata from "../ModalValidata.vue";
import Combobox from "../../combobox/Combobox.vue";
// //coordinates follow screen  ( pixel )
// const COORDINATES = {
//   shopCode: { left: "742px", top: "-6px" },
//   shopName: { left: "742px", top: "42px" },
//   address: { left: "742px", top: "90px" },
// };
// const TALK_VALIDATE = {
//   shopCode_Empty: "Mã cửa hàng không được bỏ trống",
//   shopCode_30maxLength: "Mã cửa hàng không quá 30 ký tự",
//   shopName_Empty: "Tên cửa hàng không được bỏ trống",
//   address_Empty: "Địa chỉ cửa hàng không được bỏ trống",
// };
export default {
  data() {
    return {
      // COORDINATES, // phải thêm nó mới hoạt động
      // TALK_VALIDATE,
      visible: false,
      shop: {
        shopCode: "",
        shopName: "",
        address: "",
        phone: "",
        taxCode: "",
        wardId: 0,
        statusId: null,
        street: "",
        createDate: null,
        createUserId: "149fb958744f70c67709bf1378b8dc91",
      },
      selectedCountry: 0,
      optionCountry: [{ text: "--quốc gia--", value: 0 }],
      selectedCity: 0,
      optionCity: [{ text: "--tỉnh/thành phố--", value: 0 }],
      selectedDistrict: 0,
      optionDistrict: [{ text: "--quận/huyện--", value: 0 }],
      optionWard: [{ text: "--xã/phường--", value: 0 }],

      validateBag: {
        coordinates: vldShop.COORDINATES.shopCode,
        talk: "",
      },

      validate: {
        shopCode: true,
        shopName: true,
        address: true,
      },
    };
  },
  components: {
    BaseModalForm,
    ModalValidata,
    Combobox,
  },
  methods: {
    //lấy danh sách quốc gia
    getCounTryData: async function () {
      const response = await axios.get(
        `${config.apiUrl}/CounTry/BaseAll`
      );
      var optionCountry = [];
      optionCountry.push({ text: "--quốc gia--", value: 0 });
      response.data.data.forEach(function (item) {
        optionCountry.push({
          text: item.countryName,
          value: item.countryId,
        });
      });
      this.optionCountry = optionCountry;
    },
    // lấy danh sách thành phố theo quốc gia
    getCityData: async function () {
      const response = await axios.get(`${config.apiUrl}/City`, {
        params: {
          countryId: this.selectedCountry,
        },
      });
      var optionCity = [];
      optionCity.push({ text: "--tỉnh/thành phố--", value: 0 });
      response.data.data.forEach(function (item) {
        optionCity.push({
          text: item.cityName,
          value: item.cityId,
        });
      });
      this.optionCity = optionCity;
    },
    // lấy danh sách quận/huyện theo tỉnh/thành phố
    getDistrictData: async function () {
      const response = await axios.get(`${config.apiUrl}/District`, {
        params: {
          cityId: this.selectedCity,
        },
      });
      var optionDistrict = [];
      optionDistrict.push({ text: "--quận/huyện--", value: 0 });
      response.data.data.forEach(function (item) {
        optionDistrict.push({
          text: item.districtName,
          value: item.districtId,
        });
      });
      this.optionDistrict = optionDistrict;
    },

    // lấy danh sách xã/phường theo quận huyện
    getWardData: async function () {
      const response = await axios.get(`${config.apiUrl}/Ward`, {
        params: {
          districtId: this.selectedDistrict,
        },
      });
      var optionWard = [];
      optionWard.push({ text: "--xã/phường--", value: 0 });
      response.data.data.forEach(function (item) {
        optionWard.push({
          text: item.wardName,
          value: item.wardId,
        });
      });
      this.optionWard = optionWard;
    },

    hide: async function () {
      this.$refs.BaseForm_ref.hide();
    },

    show: async function () {
      this.resetForm();
      this.$refs.BaseForm_ref.show();
      await this.hideValidate();
      await this.getCounTryData();
    },

    //hiện thông báo validate dữ liệu
    showValidate: async function () {
      this.$refs.ModalValidata_ref.show();
    },

    // ẩn thông báo validate dữ liệu
    hideValidate: async function () {
      this.$refs.ModalValidata_ref.hide();
    },

    checkValidate: function () {
      var check = true;

      if (!this.validate.shopCode) {
        this.val_ShopCode(); // kiểm tra lại và show diglog valide;
        check = false;
      }
      if (!this.validate.shopName) {
        this.val_ShopName(); // kiểm tra lại và show diglog valide;
        check = false;
      }
      if (!this.validate.address) {
        this.val_Address(); // kiểm tra lại và show diglog valide;
        check = false;
      }
      return check;
    },

    // thực hiện chức năng thêm mới bản ghi
    // params: left - trạng thái có ở lại sau khi thêm mới thành công hay không
    Confirm: async function (leave) {
      if (!this.checkValidate()) {
        console.log(this.$el.querySelector('input[class="is-valid-fail"]'));
        return;
      }
      var confirm;
      // lấy ra ngày giờ hiện tại
      var timeZoneffset = new Date().getTimezoneOffset() * 60000; //offset in milliseconds
      this.shop.createDate = new Date(Date.now() - timeZoneffset)
        .toISOString()
        .slice(0, -1);
      ///
      await axios
        .post(`${config.apiUrl}/Shop`, this.shop)
        .then(function (res) {
          console.log("success: " + res.data);
          confirm = res.data;
        })
        .catch(function (err) {
          console.log("false: " + err);
          confirm = err.response.data;
        });
      this.$emit("created", confirm, leave);
    },
    // reset dữ liệu trong form
    resetForm: function () {
      this.shop.shopCode = "";
      this.shop.shopName = "";
      this.shop.address = "";
      this.shop.phone = "";
      this.shop.taxCode = "";
      this.shop.wardId = 0;
      this.shop.street = "";

      this.selectedCountry = 0;
      this.selectedCity = 0;
      this.selectedDistrict = 0;

      this.validate.shopCode = true;
      this.validate.shopName = true;
      this.validate.address = true;
    },

    /// validate
    // - ShopCode
    val_ShopCode: function () {
      var resutlBag = vldShop.shopCode(this.shop.shopCode);
      if (resutlBag.success == true) {
        this.hideValidate();
        this.validate.shopCode = true;
      } else {
        this.validateBag.coordinates = resutlBag.coordinates;
        this.validateBag.talk = resutlBag.talk;
        this.showValidate();
        this.validate.shopCode = false;
      }
    },

    // - ShopName
    val_ShopName: function () {
      var resutlBag = vldShop.shopName(this.shop.shopName);
      if (resutlBag.success == true) {
        this.hideValidate();
        this.validate.shopName = true;
      } else {
        this.validateBag.coordinates = resutlBag.coordinates;
        this.validateBag.talk = resutlBag.talk;
        this.showValidate();
        this.validate.shopName = false;
      }
    },

    // - Address
    val_Address: function () {
      var resutlBag = vldShop.shopAddress(this.shop.address);
      if (resutlBag.success == true) {
        this.hideValidate();
        this.validate.address = true;
      } else {
        this.validateBag.coordinates = resutlBag.coordinates;
        this.validateBag.talk = resutlBag.talk;
        this.showValidate();
        this.validate.address = false;
      }
    },
    ///-------------------------
  },

  watch: {
    "shop.shopCode": function () {
      this.val_ShopCode();
    },
    "shop.shopName": function () {
      this.val_ShopName();
    },
    "shop.address": function () {
      this.val_Address();
    },
    selectedCountry: async function () {
      await this.getCityData();
      this.selectedCity = 0;
    },
    selectedCity: async function () {
      await this.getDistrictData();
      this.selectedDistrict = 0;
    },
    selectedDistrict: async function () {
      await this.getWardData();
      this.shop.wardId = 0;
    },
  },
};
</script>
<style src="../modal.scss" lang="scss" />

<style scoped>
.h-dialog-content {
  height: fit-content;
  top: 0 !important;
  bottom: 0 !important;
  width: 800px;
}

.h-dialog-footer {
  background-color: #e5e5e5;
}
.form-control {
  height: 35px;
  margin-left: auto;
}

.w-lg {
  width: 620px;
  margin-left: auto;
}

.w-sm {
  width: 244px;
}
.h-100 {
  height: 100%;
}
.p-column {
  padding-left: 1.2rem;
}
</style>

