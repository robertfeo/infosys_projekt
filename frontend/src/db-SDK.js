import axios from 'axios';

const API_BASE_URL = 'http://localhost:3000';

// Property  API requests

// GET request to retrieve all properties
export const getProperties = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/properties`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
// GET request to retrieve all properties and Owners
export const getAllProperties = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/properties-owners`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
// GET request to retrieve a property by ID
export const getPropertyById = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/properties/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving property');
    }
};

// POST request to create a new property
export const createProperty = async (propertyData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/properties`, propertyData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error creating property');
    }
};

// PATCH request to update a property by ID
export const updateProperty = async (id, propertyData) => {
    try {
        const response = await axios.patch(`${API_BASE_URL}/properties/${id}`, propertyData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error updating property');
    }
};

// DELETE request to delete a property by ID
export const deleteProperty = async (id) => {
    try {
        const response = await axios.delete(`${API_BASE_URL}/properties/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error deleting property');
    }
};

//getPropertyDetails
export const getPropertiesDetails = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/properties-details/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
//getUnitsOfProperty
export const getPropertiesUnits = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/properties-units/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
export const getRentForUnit = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/rent/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving rent');
    }
};
// Owner API requests

// GET request to retrieve all owners
export const getOwners = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/owners`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving owners');
    }
};

// GET request to retrieve an owner by ID
export const getOwnerById = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/owners/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving owner');
    }
};

// POST request to create a new owner
export const createOwner = async (ownerData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/owners`, ownerData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error creating owner');
    }
};

// DELETE request to delete an owner by ID
export const deleteOwner = async (id) => {
    try {
        const response = await axios.delete(`${API_BASE_URL}/owners/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error deleting owner');
    }
};

// Tenant API requests

// GET request to retrieve all tenants
export const getTenants = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/tenants`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving tenants');
    }
};

// GET request to retrieve a tenant by ID
export const getTenantById = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/tenants/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving tenant');
    }
};

// POST request to create a new tenant
export const createTenant = async (tenantData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/tenants`, tenantData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error creating tenant');
    }
};

// DELETE request to delete a tenant by ID
export const deleteTenant = async (id) => {
    try {
        const response = await axios.delete(`${API_BASE_URL}/tenants/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error deleting tenant');
    }
};

// Servcie API
export const getAllServiceChargeSettlements = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/service-charge-settlements`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving the data');
    }
};

export const getScssOfLease = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/ScssOfLease/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
export const getScsDetails = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/getScsDetails/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
export const getScofScss = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/getScofScss/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};

// Lease API

export const getAllLeases = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/leases`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving the data');
    }
};

export const getLeasesOfUnit = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/lease-units/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};
export const getLeaseDetails = async (id) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/lease-details/${id}`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving properties');
    }
};

//Units API

export const getAllUnits = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/units`);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error retrieving the data');
    }
};
export const createUnit = async (unitData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/units`, unitData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error inserting the data');
    }
};

//generalLedger/Stage APi
export const createStage = async (stageData) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/payment`, stageData);

        return response.data;
    } catch (error) {
        console.error(error);
        throw new Error('Error inserting the data');
    }
};
