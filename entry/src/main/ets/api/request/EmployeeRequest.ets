export class EmployeeRequest {

  constructor(userId?: number, status?: number) {
    this.userId = userId
    this.status = status
  }
  userId: number
  status: number
}